//
//  WeatherViewModel.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var isLoading = false

    func fetchWeather(lat: Double, lon: Double) {
        isLoading = true
        
        guard let url = buildWeatherURL(lat: lat, lon: lon) else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedData = try JSONDecoder().decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    self.weather = decodedData
                    print("Data fetched succesfully from\n\(url.absoluteString)")
                    self.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    print("There was some error while fetching your data! \(error.localizedDescription)\n\(url.absoluteString)")
                    self.isLoading = false
                }
            }
        }
    }

    private func buildWeatherURL(lat: Double, lon: Double) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.open-meteo.com"
        components.path = "/v1/forecast"

        components.queryItems = [
            URLQueryItem(name: "latitude", value: "\(lat)"),
            URLQueryItem(name: "longitude", value: "\(lon)"),
            URLQueryItem(name: "current", value: "temperature_2m,relative_humidity_2m,precipitation,weather_code,wind_speed_10m,is_day"),
            URLQueryItem(name: "hourly", value: "temperature_2m,weather_code,is_day"),
            URLQueryItem(name: "daily", value: "weather_code,temperature_2m_max,temperature_2m_min"),
            URLQueryItem(name: "forecast_days", value: "14"),
        ]

        return components.url
    }
}

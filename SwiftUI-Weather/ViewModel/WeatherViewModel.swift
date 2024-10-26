//
//  WeatherViewModel.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weatherList: [City: Weather] = [:]
    @Published var isLoading = false
    
    func loadWeather(for cities: [City]) async {
        for city in cities {
            do {
                let weather = try await fetchWeather(lat: city.lat, lon: city.lon)
                DispatchQueue.main.async {
                    self.weatherList[city] = weather
                    self.isLoading = false
                }
            } catch {
                fatalError("Error fetching weather for \(city): \(error.localizedDescription)")
            }
        }
    }

    private func fetchWeather(lat: Double, lon: Double) async throws -> Weather {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        guard let url = buildWeatherURL(lat: lat, lon: lon) else { throw URLError(.badURL) }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let weatherData = try JSONDecoder().decode(Weather.self, from: data)
            return weatherData
        } catch {
            throw URLError(.badServerResponse)
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

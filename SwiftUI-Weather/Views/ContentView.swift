//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    let cities = [
        City(name: "Warsaw", lat: 52.2298, lon: 21.0118),
        City(name: "New York", lat: 40.7128, lon: -73.935242)
    ]

    var body: some View {
        ZStack(alignment: .top) {
            if let weather = viewModel.weatherList[cities[1]] {
                Color("background")
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 20) {
                        BigWidgetView(cityName: cities[1].name, currentWeather: weather.current)
                        HourlyForecastView(weather: weather)
                        DailyForecastView(weather: weather)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                await viewModel.loadWeather(for: cities)
            }
        }
    }
}

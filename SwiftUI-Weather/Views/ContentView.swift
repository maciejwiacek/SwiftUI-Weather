//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    @State private var isLoading = true
    let cities = [
        City(name: "Warsaw", lat: 52.2298, lon: 21.0118),
        City(name: "New York", lat: 40.7128, lon: -73.935242)
    ]

    var body: some View {
        ZStack(alignment: .top) {
            if !isLoading {
                Color("background")
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 20) {
                        BigWidgetView(cityName: viewModel.forecasts[0].city.name,
                                      currentWeather: viewModel.forecasts[0].weather.current)
                        HourlyForecastView(weather: viewModel.forecasts[0].weather)
                        DailyForecastView(weather: viewModel.forecasts[0].weather)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            Task {
                await viewModel.loadForecast(for: cities)
                isLoading = false
            }
        }
    }
}

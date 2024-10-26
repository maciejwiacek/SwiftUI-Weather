//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        ZStack(alignment: .top) {
            if let weather = viewModel.weather {
                Color("background")
                    .ignoresSafeArea()
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 20) {
                        BigWidgetView(currentWeather: weather.current)
                        HourlyForecastView(weather: weather)
                        DailyForecastView(weather: weather)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchWeather(lat: 52.2298, lon: 21.0118)
        }
    }
}

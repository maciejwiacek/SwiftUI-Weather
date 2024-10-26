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
        City(name: "New York", lat: 40.7128, lon: -73.935242),
    ]

    var body: some View {
        NavigationStack {
            if !isLoading {
                ZStack(alignment: .top) {
                    Color(.background)
                        .ignoresSafeArea()
                    
                    List(viewModel.forecasts) { forecast in
                        NavigationLink(value: forecast) {
                            HStack {
                                VStack {
                                    Text(forecast.city.name)
                                    Text(forecast.weather.current.description)
                                }
                                Spacer()
                                Image(forecast.weather.current.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 40)
                                Spacer()
                                Text(
                                    String(
                                        format: "%0.0f°",
                                        forecast.weather.current.temperature))
                            }
                        }
                        .listRowBackground(Color(.lightBlue))
                    }
                    .scrollContentBackground(.hidden)
                }
                .navigationDestination(for: Forecast.self) { forecast in
                    WeatherDetailView(forecast: forecast)
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

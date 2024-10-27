//
//  WeatherDetailView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 27/10/2024.
//

import SwiftUI

struct WeatherDetailView: View {
    let forecast: Forecast
    
    var body: some View {
        ZStack(alignment: .top) {
            Color("background")
                .ignoresSafeArea()
            ScrollView {
                LazyVStack(alignment: .center, spacing: 20) {
                    BigWidgetView(cityName: forecast.city.name,
                                  currentWeather: forecast.weather.current,
                                  forecast: forecast)
                    HourlyForecastView(weather: forecast.weather)
                    DailyForecastView(weather: forecast.weather)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

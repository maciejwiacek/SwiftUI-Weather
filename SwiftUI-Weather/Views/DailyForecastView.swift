//
//  DailyForecastView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import SwiftUI

struct DailyForecastView: View {
    let weather: Weather
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("10-day forecast")
                .font(.custom("Inter", size: 25))
                .fontWeight(.semibold)
                .foregroundStyle(Color("dark-blue"))
            ForEach(0..<10) { index in
                DailyWidgetView(temperatureMin: weather.daily.temperatureMin[index],
                                temperatureMax: weather.daily.temperatureMax[index],
                                icon: weather.daily.icon[index],
                                description: weather.daily.description[index],
                                timestamp: weather.daily.time[index],
                                timezone: weather.timezone)
            }
        }
        .padding(.horizontal)
    }
}

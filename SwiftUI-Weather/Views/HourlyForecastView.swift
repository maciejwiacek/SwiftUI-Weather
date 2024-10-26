//
//  HourlyForecastView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import SwiftUI

struct HourlyForecastView: View {
    let weather: Weather
    
    var startingHourIndex: Int {
        let timeStrings = weather.hourly.time
        let currentTimeString = weather.current.time
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: weather.timezone)
        
        guard let currentTime = dateFormatter.date(from: currentTimeString) else {
            fatalError("Invalid current time string")
        }
        
        let timeDates = timeStrings.compactMap{ dateFormatter.date(from: $0) }
        
        guard let startIndex = timeDates.firstIndex(where: { $0 >= currentTime }) else {
            fatalError("Invalid current time string")
        }
        
        return startIndex
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("24-hour forecast")
                .font(.custom("Inter", size: 25))
                .fontWeight(.semibold)
                .foregroundStyle(Color("dark-blue"))
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(Array(startingHourIndex ..< startingHourIndex + 24), id: \.self) { index in
                        HourlyWidgetView(temperature: weather.hourly.temperature[index],
                                         icon: weather.hourly.icon[index],
                                         timestamp: weather.hourly.time[index],
                                         timezone: weather.timezone)
                            .padding(.trailing, 5)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.leading)
    }
}

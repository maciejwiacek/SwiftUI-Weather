//
//  BigWidgetView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 23/10/2024.
//

import SwiftUI

struct DetailView: View {
    let icon: String
    let value: String
    let description: String

    var body: some View {
        VStack {
            Image(icon)

            Text(value)
                .fontWeight(.semibold)
                .font(.custom("Inter", size: 14))
                .foregroundStyle(Color("dark-blue"))

            Text(description)
                .font(.custom("Inter", size: 10))
                .foregroundStyle(Color("accent-blue"))
        }
        .frame(width: 80)
    }
}

struct BigWidgetView: View {
    let cityName: String
    let currentWeather: CurrentWeather
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM, EEEE"
        return formatter.string(from: Date())
    }

    var body: some View {
        ZStack(alignment: .top) {
            Image(currentWeather.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .offset(y: 60)

            Button {
                // Show list view
            } label: {
                Image("burger-icon")
            }
            .offset(x: -150, y: 15)

            VStack {
                Text(cityName)
                    .bold()
                    .font(.custom("Inter", size: 30))
                    .foregroundStyle(Color("dark-blue"))

                Text(dateString)
                    .foregroundStyle(Color("accent-blue"))
                    .font(.custom("Inter", size: 15))

                Spacer()

                VStack {
                    Text(String(format: "%0.0f°", currentWeather.temperature))
                        .bold()
                        .font(.custom("Inter", size: 80))
                        .foregroundStyle(Color("dark-blue"))

                    Text(currentWeather.description)
                        .font(.custom("Inter", size: 20))
                        .foregroundStyle(Color("accent-blue"))
                }

                HStack(spacing: 50) {
                    DetailView(
                        icon: "wind-icon",
                        value: (String(
                            format: "%0.0fkm/h", currentWeather.windSpeed)),
                        description: "Wind")
                    DetailView(
                        icon: "cloud-icon",
                        value: "\(currentWeather.humidity)%",
                        description: "Humidity")
                    DetailView(
                        icon: "rain-icon",
                        value: "\(currentWeather.precipitation)%",
                        description: "Chance of rain")
                }
                .padding()
            }
        }
        .frame(height: 480)
        .padding(.top, 30)
        .background(Color("light-blue"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

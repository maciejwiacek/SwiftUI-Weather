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
    var body: some View {
        ZStack(alignment: .top) {
            Image("cloudy")
                .offset(x: -15, y: 30)
            
            Button {
                // Show list view
            } label: {
                Image("burger-icon")
            }
            .offset(x: -150, y: 15)
            
            VStack {
                Text("Warsaw")
                    .bold()
                    .font(.custom("Inter", size: 30))
                    .foregroundStyle(Color("dark-blue"))
                
                Text("23 Oct, Wednesday")
                    .foregroundStyle(Color("accent-blue"))
                    .font(.custom("Inter", size: 15))
                
                Spacer()
                
                VStack {
                    Text("13°")
                        .bold()
                        .font(.custom("Inter", size: 80))
                        .foregroundStyle(Color("dark-blue"))
                    
                    Text("Partly Cloudy")
                        .font(.custom("Inter", size: 20))
                        .foregroundStyle(Color("accent-blue"))
                }
                
                HStack(spacing: 50) {
                    DetailView(icon: "wind-icon", value: "13km/h", description: "Wind")
                    DetailView(icon: "cloud-icon", value: "24%", description: "Humidity")
                    DetailView(icon: "rain-icon", value: "15%", description: "Chance of rain")
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

#Preview {
    BigWidgetView()
}
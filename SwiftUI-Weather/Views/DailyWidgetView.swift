//
//  DailyWidgetView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import SwiftUI

struct DailyWidgetView: View {
    let temperatureMin: Double
    let temperatureMax: Double
    let icon: String
    let description: String
    let timestamp: String
    let timezone: String
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: timezone)
        
        let outputDate = DateFormatter()
        outputDate.dateFormat = "E"
        outputDate.timeZone = TimeZone.current
        
        if let date = formatter.date(from: timestamp) {
            return outputDate.string(from: date)
        }
        fatalError("Could not convert timestamp to local hours.")
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Text(dateString)
                .foregroundStyle(Color("accent-blue"))
                .font(.custom("Inter", size: 16))
                .fontWeight(.medium)
            Spacer()
            HStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                Text(description)
                    .foregroundStyle(Color("accent-blue"))
                    .font(.custom("Inter", size: 16))
                    .fontWeight(.medium)
            }
            Spacer()
            HStack(alignment: .bottom, spacing: 2) {
                Text(String(format: "%0.0f°", temperatureMax))
                    .foregroundStyle(Color("dark-blue"))
                    .font(.custom("Inter", size: 20))
                    .fontWeight(.semibold)
                Text(String(format: "%0.0f°", temperatureMin))
                    .foregroundStyle(Color("accent-blue"))
                    .font(.custom("Inter", size: 16))
                    .fontWeight(.medium)
            }
        }
        .padding()
        .background(Color("light-blue"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

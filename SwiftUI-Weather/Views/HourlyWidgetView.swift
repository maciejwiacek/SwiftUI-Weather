//
//  HourlyWidgetView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import SwiftUI

struct HourlyWidgetView: View {
    let temperature: Double
    let icon: String
    let timestamp: String
    let timezone: String
    
    var timeString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        formatter.timeZone = TimeZone(identifier: timezone)
        
        let outputDate = DateFormatter()
        outputDate.dateFormat = "HH"
        outputDate.timeZone = TimeZone(identifier: timezone)
        
        if let date = formatter.date(from: timestamp) {
            return outputDate.string(from: date)
        }
        fatalError("Could not convert timestamp to local hours.")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(String(format: "%0.0f°", temperature))
                .font(.custom("Inter", size: 15))
                .bold()
                .foregroundStyle(Color("dark-blue"))
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            Text(timeString)
                .font(.custom("Inter", size: 12))
                .fontWeight(.medium)
                .foregroundStyle(Color("accent-blue"))
        }
        .padding()
        .background(Color("light-blue"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

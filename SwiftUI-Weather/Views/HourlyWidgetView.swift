//
//  HourlyWidgetView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import SwiftUI

struct HourlyWidgetView: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("13°")
                .font(.custom("Inter", size: 15))
                .bold()
                .foregroundStyle(Color("dark-blue"))
            Image("cloudy")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
            Text("10:00")
                .font(.custom("Inter", size: 12))
                .fontWeight(.medium)
                .foregroundStyle(Color("accent-blue"))
        }
        .padding()
        .background(Color("light-blue"))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    HourlyWidgetView()
}

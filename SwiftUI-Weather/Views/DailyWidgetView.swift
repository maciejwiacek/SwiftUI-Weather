//
//  DailyWidgetView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import SwiftUI

struct DailyWidgetView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text("Mon")
                .foregroundStyle(Color("accent-blue"))
                .font(.custom("Inter", size: 16))
                .fontWeight(.medium)
            Spacer()
            HStack {
                Image("cloudy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                Text("Cloudy")
                    .foregroundStyle(Color("accent-blue"))
                    .font(.custom("Inter", size: 16))
                    .fontWeight(.medium)
            }
            Spacer()
            HStack(alignment: .bottom, spacing: 2) {
                Text("13°")
                    .foregroundStyle(Color("dark-blue"))
                    .font(.custom("Inter", size: 20))
                    .fontWeight(.semibold)
                Text("7°")
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

#Preview {
    DailyWidgetView()
}

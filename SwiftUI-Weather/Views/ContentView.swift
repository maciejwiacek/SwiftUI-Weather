//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 23/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("background")
                .ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 20) {
                    BigWidgetView()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Today")
                            .font(.custom("Inter", size: 25))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("dark-blue"))
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(1..<24) { _ in
                                    HourlyWidgetView()
                                        .padding(.trailing, 5)
                                }
                            }
                        }
                        .scrollIndicators(.hidden)
                        
                        Text("10-day forecast")
                            .font(.custom("Inter", size: 25))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("dark-blue"))
                        ForEach(1..<10) { _ in
                            DailyWidgetView()
                                .padding(.trailing)
                        }
                    }
                    .padding(.leading)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

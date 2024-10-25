//
//  WeatherModel.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

struct Weather: Decodable {
    let current: Current
    let hourly: Hourly
    let daily: Daily
}

struct Current: Decodable {
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature_2m"
        case humidity = "relative_humidity_2m"
        case windSpeed = "wind_speed_10m"
        case precipitation = "precipitation"
        case weatherCode = "weather_code"
    }
    
    let temperature: Double
    let humidity: Int
    let windSpeed: Double
    let precipitation: Double
    let weatherCode: Int
}

struct Hourly: Decodable {
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case temperature = "temperature_2m"
        case weatherCode = "weather_code"
    }
    
    let time: [String]
    let temperature: [Double]
    let weatherCode: [Int]
}

struct Daily: Decodable {
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case weatherCode = "weather_code"
        case temperatureMin = "temperature_2m_min"
        case temperatureMax = "temperature_2m_max"
    }
    
    let time: [String]
    let weatherCode: [Int]
    let temperatureMin: [Double]
    let temperatureMax: [Double]
}

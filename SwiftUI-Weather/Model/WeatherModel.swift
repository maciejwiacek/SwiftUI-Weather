//
//  WeatherModel.swift
//  SwiftUI-Weather
//
//  Created by Maciej Wiącek on 25/10/2024.
//

import Foundation

struct City: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let lat: Double
    let lon: Double
}

struct Weather: Decodable {
    let timezone: String
    let current: CurrentWeather
    let hourly: HourlyWeather
    let daily: DailyWeather
}

struct CurrentWeather: Decodable {
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature_2m"
        case humidity = "relative_humidity_2m"
        case windSpeed = "wind_speed_10m"
        case precipitation = "precipitation"
        case weatherCode = "weather_code"
        case time = "time"
        case isDay = "is_day"
    }

    let temperature: Double
    let humidity: Int
    let windSpeed: Double
    let precipitation: Int
    let weatherCode: Int
    let time: String
    let isDay: Int
}

struct HourlyWeather: Decodable {
    enum CodingKeys: String, CodingKey {
        case time = "time"
        case temperature = "temperature_2m"
        case weatherCode = "weather_code"
        case isDay = "is_day"
    }

    let time: [String]
    let temperature: [Double]
    let weatherCode: [Int]
    let isDay: [Int]
}

struct DailyWeather: Decodable {
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

extension CurrentWeather {
    var icon: String {
        switch weatherCode {
        case 0:
            return "clear" + (isDay != 0 ? "" : "Night")
        case 1:
            return "slightlyCloudy" + (isDay != 0 ? "" : "Night")
        case 2:
            return "partlyCloudy" + (isDay != 0 ? "" : "Night")
        case 3, 45, 48:
            return "cloudy"
        case 51, 53, 55, 56, 57:
            return "drizzle" + (isDay != 0 ? "" : "Night")
        case 61, 63, 65, 66, 67, 80, 81, 82, 71, 73, 75, 77, 85, 86:
            return "rain"
        case 95, 96, 99:
            return "thunderstorm"
        default:
            fatalError("Incorrect Weather Code!")
        }
    }
    
    var description: String {
        switch weatherCode {
        case 0:
            return "Clear Sky"
        case 1:
            return "Mainly Clear"
        case 2:
            return "Partly Cloudy"
        case 3, 45, 48:
            return "Cloudy"
        case 51, 53, 55, 56, 57:
            return "Drizzle"
        case 61, 63, 65, 66, 67, 80, 81, 82, 71, 73, 75, 77, 85, 86:
            return "Rain"
        case 95, 96, 99:
            return "Thunderstorm"
        default:
            fatalError("Incorrect Weather Code!")
        }
    }
}

extension HourlyWeather {
    var icon: [String] {
        var icons: [String] = []

        for i in 0..<weatherCode.count {
            switch weatherCode[i] {
            case 0:
                icons.append("clear" + (isDay[i] != 0 ? "" : "Night"))
            case 1:
                icons.append(
                    "slightlyCloudy" + (isDay[i] != 0 ? "" : "Night"))
            case 2:
                icons.append("partlyCloudy" + (isDay[i] != 0 ? "" : "Night"))
            case 3, 45, 48:
                icons.append("cloudy")
            case 51, 53, 55, 56, 57:
                icons.append("drizzle" + (isDay[i] != 0 ? "" : "Night"))
            case 61, 63, 65, 66, 67, 80, 81, 82, 71, 73, 75, 77, 85, 86:
                icons.append("rain")
            case 95, 96, 99:
                icons.append("thunderstorm")
            default:
                fatalError("Incorrect Weather Code!")
            }
        }

        return icons
    }
}

extension DailyWeather {
    var icon: [String] {
        var icons: [String] = []

        for i in 0..<weatherCode.count {
            switch weatherCode[i] {
            case 0:
                icons.append("clear")
            case 1:
                icons.append("slightlyCloudy")
            case 2:
                icons.append("partlyCloudy")
            case 3, 45, 48:
                icons.append("cloudy")
            case 51, 53, 55, 56, 57:
                icons.append("drizzle")
            case 61, 63, 65, 66, 67, 80, 81, 82, 71, 73, 75, 77, 85, 86:
                icons.append("rain")
            case 95, 96, 99:
                icons.append("thunderstorm")
            default:
                fatalError("Incorrect Weather Code!")
            }
        }

        return icons
    }

    var description: [String] {
        var descriptions: [String] = []

        for code in weatherCode {
            switch code {
            case 0:
                descriptions.append("Clear Sky")
            case 1:
                descriptions.append("Mainly Clear")
            case 2:
                descriptions.append("Partly Cloudy")
            case 3, 45, 48:
                descriptions.append("Cloudy")
            case 51, 53, 55, 56, 57:
                descriptions.append("Drizzle")
            case 61, 63, 65, 66, 67, 80, 81, 82, 71, 73, 75, 77, 85, 86:
                descriptions.append("Rain")
            case 95, 96, 99:
                descriptions.append("Thunderstorm")
            default:
                fatalError("Incorrect Weather Code!")
            }
        }

        return descriptions
    }
}

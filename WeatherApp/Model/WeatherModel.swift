//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import Foundation

struct Coordinate: Decodable {
    let lat: Double
    let lon: Double
}

struct Weather: Decodable {
    let main: String
    let description: String
    let icon: String
    
    enum CodingKeys: CodingKey {
        case main
        case description
        case icon
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.main = try container.decode(String.self, forKey: .main)
        self.description = try container.decode(String.self, forKey: .description)
        self.icon = "https://openweathermap.org/img/wn/\(try container.decode(String.self, forKey: .icon))@2x.png"
    }
}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp, humidity
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp = try container.decode(Double.self, forKey: .temp) - 273.15
        self.feelsLike = try container.decode(Double.self, forKey: .feelsLike) - 273.15
        self.tempMin = try container.decode(Double.self, forKey: .tempMin) - 273.15
        self.tempMax = try container.decode(Double.self, forKey: .tempMax) - 273.15
        self.humidity = try container.decode(Int.self, forKey: .humidity)
    }
}

struct Wind: Decodable {
    let speed: Double
    let gust: Double?
    
    enum CodingKeys: CodingKey {
        case speed
        case gust
    }
}

struct Rain: Decodable {
    let oneHour: Double
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

struct Snow: Decodable {
    let oneHour: Double
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

struct Cloud: Decodable {
    let all: Int
}

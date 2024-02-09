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
}

struct Main: Decodable {
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
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
    }
}

struct Wind: Decodable {
    let speed: Double
    let gust: Double
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

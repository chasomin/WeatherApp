//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import Foundation

struct CurrentWeather: Decodable {
    let coord: Coordinate
    let weather: [Weather]
    let main: Main?
    let wind: Wind
    let rain: Rain?
    let snow: Snow?
    let clouds: Cloud
    let id: Int
    let name: String
}


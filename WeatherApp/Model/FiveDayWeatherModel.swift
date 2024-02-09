//
//  FiveDayWeather.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import Foundation

struct FiveDayWeather: Decodable {
    let list: [WeatherList]
}

struct WeatherList: Decodable {
    let weather: Weather
    let main: Main
    let wind: Wind
    let rain: Rain?
    let snow: Snow?
    let clouds: Cloud
}

//
//  CityModel.swift
//  WeatherApp
//
//  Created by 차소민 on 2/13/24.
//

import Foundation

struct City: Decodable {
    let id: Int
    let name: String
    let state: String
    let country: String
    let coord: Coord
}

struct Coord: Decodable{
    let lon: Double
    let lat: Double
}

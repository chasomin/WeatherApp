//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import Foundation

enum WeatherAPI {
    case current(appid: String, id: Int)
    case currentCoodinate(appid: String, lat: Double, lon: Double)
    case fiveDay(appid: String, id: Int)
    case fiveDayCoodinate(appid: String, lat: Double, lon: Double)
    
    var scheme: String {
        return "https"
    }
    var host: String {
        return "api.openweathermap.org"
    }
    var path: String {
        switch self {
        case .current, .currentCoodinate:
            return "/data/2.5/weather"
        case .fiveDay, .fiveDayCoodinate:
            return "/data/2.5/forecast"
        }
    }
    var quary: [URLQueryItem] {
        switch self {
        case .current(let appid, let id), .fiveDay(let appid, let id):
            [
                URLQueryItem(name: "appid", value: appid ),
                URLQueryItem(name: "id", value: String(id)),
            ]
        case .currentCoodinate(let appid, let lat, let lon), .fiveDayCoodinate(let appid, let lat, let lon):
            [
                URLQueryItem(name: "appid", value: appid),
                URLQueryItem(name: "lat", value: String(lat)),
                URLQueryItem(name: "lon", value: String(lon))
            ]

        }
    }
    
}



//
//  FiveDayWeather.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import Foundation

struct FiveDayWeather: Decodable {
    let list: [WeatherList]
    
    var resultList: [WeatherList] {
        list.filter {
            $0.dt_txt.contains("00:00:00")
        }
    }
}

struct WeatherList: Decodable {
    let weather: [Weather]
    let main: Main
    let wind: Wind
    let rain: Rain?
    let snow: Snow?
    let clouds: Cloud
    let dt_txt: String
    
    var time: String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = format.date(from: dt_txt) ?? Date()
        
        let format2 = DateFormatter()
        format2.dateFormat = "a h시"
        let result = format2.string(from: date)
        
        return result

    }
    
    var week: String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = format.date(from: dt_txt) ?? Date()
        
        let format2 = DateFormatter()
        format2.dateFormat = "E"
        let result = format2.string(from: date)
        
        return result
    }
}

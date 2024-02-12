//
//  CityDataParsing.swift
//  WeatherApp
//
//  Created by 차소민 on 2/13/24.
//

import Foundation


struct CityDataParsing {
    static let shared = CityDataParsing()
    private init() { }
    
    func load(completionHandler: @escaping ([City]) -> Void) {
        var data: Data = Data()
        
        guard let url = Bundle.main.url(forResource: "CityList.json", withExtension: nil) else {
            print("CityList 파일을 찾을 수 없음")
            return
        }
        
        do {
            data = try Data(contentsOf: url)
            print(data)
        } catch {
            fatalError()
        }
        
        do {
            let result = try JSONDecoder().decode([City].self, from: data)
            completionHandler(result)
        } catch {
            print(error)
            fatalError()
        }
    }
}

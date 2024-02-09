//
//  WeatherAPIManager.swift
//  WeatherApp
//
//  Created by 차소민 on 2/9/24.
//

import UIKit

enum RequestError: String, Error {
    case failedRequest = "네트워크 통신에 실패했습니다"
    case noData = "데이터가 없습니다"
    case invaildResponse = "응답값이 유효하지 않습니다"
    case invailData = "데이터를 가져올 수 없습니다"
}

struct WeatherAPIManager {
    static let shared = WeatherAPIManager()
    private init () { }
    
    func callRequest<T: Decodable>(api: WeatherAPI, type: T.Type, completionHandler: @escaping (T?, RequestError?) -> Void) {
        var component = URLComponents()
        component.scheme = api.scheme
        component.host = api.host
        component.path = api.path
        component.queryItems = api.quary
        
        guard let url = component.url else {
            print("url nil")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completionHandler(nil, .failedRequest)
                print(RequestError.failedRequest.rawValue)
                return
            }
            
            guard let data else {
                completionHandler(nil, .noData)
                print(RequestError.noData.rawValue)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299) ~= response.statusCode else {
                completionHandler(nil, .invaildResponse)
                print(RequestError.invailData.rawValue)
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type, from: data)
                completionHandler(result, nil)
                
            } catch {
                completionHandler(nil, .invailData)
                print(RequestError.invailData.rawValue)
            }
            
        }.resume()
    }
    
}

//
//  WeatherResponse.swift
//  Weather
//
//  Created by LiewSyetChau on 5/1/22.
//

import Foundation

struct WeatherResponse: Codable {
    
    var current: Weather
    var hourly: [Weather]
    var daily: [WeatherDaily]
    
    static func empty() -> WeatherResponse {
        return WeatherResponse(current: Weather(),
                               hourly: [Weather](repeating: Weather(), count: 23),
                               daily: [WeatherDaily](repeating: WeatherDaily(), count: 8))
    }
}

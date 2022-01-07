//
//  ApiExtension.swift
//  Weather
//
//  Created by LiewSyetChau on 5/1/22.
//

import Foundation

extension API {
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURL)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
    }
}

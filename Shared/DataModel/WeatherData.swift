//
//  WeatherData.swift
//  WheatherFAll
//
//  Created by GSK on 12/6/21.
//

import Foundation

struct WeatherData: Decodable, Identifiable {
    var id: String
    var forecast: [ForecastData]
}

//
//  ForecastData.swift
//  WheatherFAll
//
//  Created by GSK on 12/6/21.
//

import Foundation
import SwiftUI

struct ForecastData: Decodable, Hashable, Identifiable {
    var id: UUID = UUID() //UUID of device
    var date: String
    var temp_min: Float
    var temp_max: Float
    var condition_name: String
    var condition_desc: String
    
    init(date: String, temp_min: Float, temp_max: Float, conditionName: String, conditionDescription: String) {
        id = UUID()
        self.date = date
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.condition_name = conditionName
        self.condition_desc = conditionDescription
    }
    init(from decoder: Decoder) throws {
        id = UUID()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(String.self, forKey: .date)
        temp_min = try container.decode(Float.self, forKey: .temp_min)
        temp_max = try container.decode(Float.self, forKey: .temp_max)
        condition_name = try container.decode(String.self, forKey: .condition_name)
        condition_desc = try container.decode(String.self, forKey: .condition_desc)
    }
    
    enum CodingKeys: String, CodingKey {
        case date
        case temp_min
        case temp_max
        case condition_name
        case condition_desc
    }
}

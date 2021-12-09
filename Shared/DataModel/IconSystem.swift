//
//  IconSystem.swift
//  WheatherFAll
//
//  Created by GSK on 12/6/21.
//

import Foundation

public enum Icon: String {
    case sun = "sun.min.fill"
    case clouday = "cloud.fill"
    case rain = "cloud.rain.fill"
    case thunderstrom = "cloud.bolt.fill"
    case strom = "wind"
    case snow = "cloud.snow.fill"
    
    static func systemIconForCondition (condition: String) -> String {
        switch condition {
        case "sun":
            return Icon.sun.rawValue
        case "clouday":
            return Icon.clouday.rawValue
        case "rain":
            return Icon.rain.rawValue
        case "thunderstrom":
            return Icon.thunderstrom.rawValue
        case "strom":
            return Icon.strom.rawValue
        case "snow":
            return Icon.snow.rawValue
        default:
            return Icon.sun.rawValue //default
        }
    }
}

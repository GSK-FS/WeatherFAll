//
//  DefaultsData.swift
//  WheatherFAll
//
//  Created by GSK on 12/6/21.
//

import Foundation
import Combine

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            return UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

final class SettingsStore: ObservableObject {
    let objectWillChange = PassthroughSubject<Void, Never>()
    @UserDefault("Celsius", defaultValue: false)
    var showCelsius: Bool {
        willSet {
            objectWillChange.send()
        }
    }
    
}

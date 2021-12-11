//
//  WeatherFAllTVApp.swift
//  WeatherFAllTV
//
//  Created by GSK on 12/11/21.
//

import SwiftUI

@main
struct WeatherFAllTVApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

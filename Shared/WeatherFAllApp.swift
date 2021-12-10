//
//  WeatherFAllApp.swift
//  Shared
//
//  Created by GSK on 12/6/21.
//

import SwiftUI

@main
struct WeatherFAllApp: App {
    let persistenceController = PersistenceController.shared

    @StateObject var settings = SettingsStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  WheatherFAllApp.swift
//  Shared
//
//  Created by GSK on 12/6/21.
//

import SwiftUI

@main
struct WheatherFAllApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            NavigationView {
//                ContentView()
                //WeatherView()
//            }
        }
    }
}

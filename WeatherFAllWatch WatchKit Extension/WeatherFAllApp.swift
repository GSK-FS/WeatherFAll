//
//  WeatherFAllApp.swift
//  WeatherFAllWatch WatchKit Extension
//
//  Created by GSK on 12/11/21.
//

import SwiftUI

@main
struct WeatherFAllApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

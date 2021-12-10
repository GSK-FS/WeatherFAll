//
//  AppTabNavigation.swift
//  WeatherFAll (iOS)
//
//  Created by GSK on 12/9/21.
//

import SwiftUI

struct AppTabNavigation: View {
    
    enum Tab {
        case weather
        case settings
    }
    
    @State private var selection: Tab = .weather
    
    var body: some View {
        TabView {
            NavigationView {
                WeatherView()
            }.tabItem {
                Label("Weather", systemImage: "thermometer.sun.fill")
                    .accessibility(label: Text("Weather"))
            }.tag(Tab.weather)
            
            NavigationView {
                SettingsView()
            }.tabItem {
                Label("Settings", systemImage: "gear")
                    .accessibility(label: Text("Settings"))
            }.tag(Tab.settings)
        }
    }
}

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}

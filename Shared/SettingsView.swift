//
//  SettingsView.swift
//  WeatherFAll
//
//  Created by GSK on 12/10/21.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsStore
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    //@State private var showCelsius = false
    
    var title: some View {
        Text("⚙️ Settings")
            .font(.title)
            .bold()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            #if os(iOS)
            if horizontalSizeClass != .compact {
                title
            }
            #elseif os(macOS)
            title
            #endif
            Divider()
            Toggle("Temperature in °C", isOn: $settings.showCelsius)
            Divider()
            Spacer()
        }.padding(50).navigationTitle(Text("⚙️ Settings"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

//
//  AppSidebarNavigation.swift
//  WeatherFAll
//
//  Created by GSK on 12/9/21.
//

import SwiftUI

struct AppSidebarNavigation: View {
    
    enum NavigationItem {
        case weather
        case settings
    }
    
    @State private var presentingSettings = false
    
    @State private var selection: Set<NavigationItem> = [.weather]
    
    var sidebar: some View {
        List(selection: $selection) {
            NavigationLink(destination: WeatherView()) {
                Label("Weather", systemImage: "thermometer.sun.fill")
            }
            .accessibility(label: Text("Weather"))
            .tag(NavigationItem.weather)
        }
        .overlay(BottomButton(presentingSettingsView: $presentingSettings), alignment: .bottom)
        .listStyle(SidebarListStyle())
    }
    struct BottomButton: View {
        @Binding var presentingSettingsView: Bool
        
        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                Divider()
                Button(action: {
                    presentingSettingsView = true
                }) {
                    Label("Settings", systemImage: "gear")
                        .padding(6)
                        .contentShape(Rectangle())
                }
                .accessibility(label: Text("Settings"))
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .buttonStyle(PlainButtonStyle())
            }.sheet(isPresented: $presentingSettingsView) {
                #if os(iOS)
                SettingsView()
                #else
                VStack(spacing: 0) {
                    SettingsView()
                    HStack {
                        Spacer()
                        Button(action: {presentingSettingsView = false}) {
                            Text("Done")
                        }.keyboardShortcut(.defaultAction)
                        Spacer()
                    }.padding()
                }
                .frame(minWidth: 400, maxWidth: 600, minHeight: 400, maxHeight: 600)
                #endif
            }

        }
    }
    
    
    var body: some View {
        NavigationView {
            sidebar
            WeatherView()
            Text("Select a day")
        }
    }
}

struct AppSidebarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarNavigation()
    }
}

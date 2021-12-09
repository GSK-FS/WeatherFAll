//
//  ContentView.swift
//  Shared
//
//  Created by GSK on 12/6/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    var body: some View {
        #if os(iOS)
        if horizontalSizeClass == .compact {
            AppTabNavigation()
        }else {
            AppSidebarNavigation()
        }
        #else
        AppSidebarNavigation()
        #endif
//            Text("Select an item")
//            .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

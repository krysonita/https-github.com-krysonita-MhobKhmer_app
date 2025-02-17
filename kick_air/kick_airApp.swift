//
//  kick_airApp.swift
//  kick_air
//
//  Created by Kry Sonita on 07/02/2025.
//

import SwiftUI

@main
struct kick_airApp: App {
    @State private var selectedTab: Tab = .home  // Example default value
    
    var body: some Scene {
        WindowGroup {
            ContentView(selectedTab: $selectedTab)
        }
    }
}

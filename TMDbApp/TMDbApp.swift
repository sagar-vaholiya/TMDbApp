//
//  TMDbAppApp.swift
//  TMDbApp

import SwiftUI

@main
struct TMDbApp: App {
    
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}

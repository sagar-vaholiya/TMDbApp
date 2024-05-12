//
//  NWMonitor.swift
//  TMDbApp

import Foundation
import Network
/// Simulator issue: https://forums.developer.apple.com/forums/thread/713330
final class NetworkMonitor: ObservableObject {
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    @Published var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            DispatchQueue.main.async { 
                self.isConnected = path.status == .satisfied
                print("Network: \(self.isConnected)")
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}

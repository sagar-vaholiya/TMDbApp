//
//  NetworkStatusView.swift
//  TMDbApp

import SwiftUI

struct NetworkStatusView: View {
    var body: some View {
        Color.white
            .ignoresSafeArea()
            .overlay(
                VStack(spacing: 20) {
                    Text("Internet status:")
                        .font(.title)
                    
                    Image(systemName: "wifi.slash")
                        .font(.title)
                        .foregroundColor(.red)
                    
                    Text("Disconnected")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            )
    }
}

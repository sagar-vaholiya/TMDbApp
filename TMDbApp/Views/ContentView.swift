//
//  ContentView.swift
//  TMDbApp

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        TabView {
            MovieListView(movieType: .latest)
                .tabItem {
                    Label("", systemImage: "rectangle.stack")
                }
            
            MovieListView(movieType: .popular)
                .tabItem {
                    Label("", systemImage: "suit.heart.fill")
                }
        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

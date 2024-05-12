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

extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}

struct ViewDidLoadModifier: ViewModifier {

    @State private var didLoad = false
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }

}

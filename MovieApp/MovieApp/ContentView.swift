//
//  ContentView.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 31/5/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            tabItem {
                Image(systemName: "play")
                Text("Movies")
            }
            
            tabItem {
                Image(systemName: "magnifyingglass")
                Text("Discover")
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

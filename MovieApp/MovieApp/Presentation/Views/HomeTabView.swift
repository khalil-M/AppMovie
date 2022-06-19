//
//  HomeTabView.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 16/6/2022.
//

import SwiftUI

struct HomeTabView: View {

    enum Tab: Int {
        case movie
        case discover
    }
    @State private var selectedTab = Tab.movie
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView()
                .tabItem {
                    tabBarItem(text: "Movies", image: "play")
                }.tag(Tab.movie)
            DiscoverView()
                .tabItem {
                    tabBarItem(text: "Discover", image: "magnifyingglass")
                }.tag(Tab.discover)
        }
        .padding()
    }
}

private func tabBarItem(text: String, image: String) -> some View {
    VStack {
        Image(systemName: image)
        Text(text)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}

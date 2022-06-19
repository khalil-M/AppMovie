//
//  MoviesView.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 31/5/2022.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var movieManager = MovieDownloadManager()
    

    var body: some View {
        VStack {
            List {
                ForEach(movieManager.movies) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieCell(movie: movie)
                    }
                    .buttonStyle(.plain)
                    .listRowBackground(Color.clear)
                }
            }
            .onAppear {
                movieManager.getNowPlaying()
            }
        }
        
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

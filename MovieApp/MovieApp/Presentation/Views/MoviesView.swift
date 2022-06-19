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
                    let title = movie.title ?? ""
                    Text("Movie \(title)")
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

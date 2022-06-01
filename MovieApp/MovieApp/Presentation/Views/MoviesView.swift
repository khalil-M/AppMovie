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
            Button {
                movieManager.getNowPlaying()
            } label: {
                Text("Get movies")
            }

            List {
                ForEach(movieManager.movies) { movie in
                    let title = movie.title ?? ""
                    Text("Movie \(title)")
                }
            }
            .onAppear {
                
            }
        }
        
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

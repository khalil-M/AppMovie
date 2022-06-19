//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 19/6/2022.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
  
    init(movie: Movie) {
        self.movie = movie
    }
    var body: some View {
        ZStack(alignment: .top) {
            backgroundView
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    headerView
                    moviePosterView
                    movieOverview
                    reviewLink
                }
                .padding(.top, 84)
                .padding(.horizontal, 32)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private var headerView: some View {
        VStack(alignment: .leading) {
            Text(movie.titleWithLanguage)
                .font(.title)
            Text("Release Date: \(movie.release_date ?? "_")")
                .font(.subheadline)
        }
        .foregroundColor(.white)
    }
    
    private var moviePosterView: some View {
        HStack(alignment: .center) {
            Spacer()
            CachedAsyncImage(url: URL(string: movie.posterPath)) { img in
                img.resizable()
            } placeholder: {
                Rectangle().foregroundColor(Color.gray.opacity(0.4))
            }
            .frame(width: 200, height: 320)
            .animation(.easeInOut(duration: 0.5))
            .transition(.opacity)
            .scaledToFill()
            .cornerRadius(20)
            Spacer()
        }
    }
    
    private var backgroundView: some View {
        CachedAsyncImage(url: URL(string: movie.posterPath)) { img in
            img.resizable()
        } placeholder: {
            Rectangle().foregroundColor(Color.gray.opacity(0.4))
        }
        .blur(radius: 100)
    }
    
    private var movieOverview: some View {
        Text(movie.overview ?? "")
            .foregroundColor(.white)
            .font(.body)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.top, 16)
    }
    
    private var reviewLink: some View {
        VStack {
            Divider()
            NavigationLink {
                MovieReviewView()
            } label: {
                HStack {
                    Text("Reviews")
                        .font(.body)
                        .fontWeight(.medium)
                    Spacer()
                }
            }
            Divider()
        }
        .foregroundColor(.white)
    }
}


//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}

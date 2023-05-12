//
//  MovieCell.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 1/6/2022.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            moviePoster
            VStack(alignment: .leading, spacing: 0) {
                movieTitle
                HStack{
                    movieVotes
                    movieReleaseData
                }
                movieOverview
            }
        }
    }
    
    @ViewBuilder
    private var movieVotes: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(movie.voteAverage))
                .stroke(Color.orange, lineWidth: 4)
                .rotationEffect(.degrees(-90))
            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.orange.opacity(0.2), lineWidth: 4)
                .frame(width: 50)
                .rotationEffect(.degrees(-90))
            Text(String.init(format: "10%%", movie.vote_average ?? 0.0))
                .font(.subheadline)
        }
    }
    
    private var movieTitle: some View {
        Text(movie.titleWithLanguage)
            .font(.system(size: 15))
            .bold()
            .foregroundColor(.blue)
    }
    
    private var moviePoster: some View {
        CachedAsyncImage(url: URL(string: movie.posterPath)) { img in
            img.resizable()
        }placeholder: {
            Rectangle().foregroundColor(Color.gray.opacity(0.4))
        }
        .frame(width: 100, height: 160)
        .animation(.easeOut(duration: 0.5))
        .transition(.opacity)
        .scaledToFill()
        .cornerRadius(15)
        .shadow(radius: 15)
    }
    
    private var movieReleaseData: some View {
        Text(movie.release_date ?? "")
            .foregroundColor(.black)
            .font(.subheadline)
    }
    
    private var movieOverview: some View {
        Text(movie.overview ?? "")
            .foregroundColor(.gray)
            .font(.body)
            .lineLimit(3)
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(id: 0, title: "My movie", original_language: nil, overview: "my long description review of this movie that I didn't like", poster_path: nil, backdrop_path: nil, popularity: nil, vote_average: 3.5, vote_count: 0, video: nil, adult: false, release_date: "31.05.2022"))
    }
}

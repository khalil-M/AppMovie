//
//  MovieDownloadManager.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 1/6/2022.

import Foundation

protocol IMovieDownloadManager {
    func getNowPlaying()
    func getUpcoming()
    func getPopular()
}


struct API {
    static let key = "3f5fccabdeefdc526419af975e8faed9"
}

enum MovieURL: String {
    case nowPlaying = "now_playing"
    case upcoming = "upcoming"
    case popular = "popular"
    
    public var urlString: String {
        "\(MovieDownloadManager.baseURL)\(self.rawValue)?api_key=\(API.key)&language=en-US&page=1"
    }
}


final class MovieDownloadManager: ObservableObject {
    
    @Published var movies = [Movie]()
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    func getNowPlaying(){
        getMovies(movieUrl: .nowPlaying)
    }
    
    func getUpcoming() {
        getMovies(movieUrl: .upcoming)
    }
    
    func getPopular() {
        getMovies(movieUrl: .popular)
    }

    private func getMovies(movieUrl: MovieURL) {
        NetworkManager<MovieResponse>.fetch(from: movieUrl.urlString) { result in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
            case .failure(let err):
                print(err)
            }
        }
    }

    
}

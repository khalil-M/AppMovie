//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 1/6/2022.
//

import Foundation
import Combine

final class NetworkManager<T: Codable> {
    static func fetch(from urlString: String) -> AnyPublisher<T, NetworkError> {
        let url = URL(string: urlString)!
        let publisher =  URLSession.shared.dataTaskPublisher(for: url)
        return publisher
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                switch error {
                case is Swift.DecodingError:
                    return NetworkError.invalidResponse
                default:
                    return NetworkError.nilResponse
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}

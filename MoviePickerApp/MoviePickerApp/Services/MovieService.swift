//
//  MovieService.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import Foundation
import Combine

struct MovieService {
    private let apiKey = "YOUR_TMDB_API_KEY"

    func fetchMovies(for genre: String) -> AnyPublisher<[Movie], Never> {
        let query = genre.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(query)") else {
            return Just([]).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: TMDBResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

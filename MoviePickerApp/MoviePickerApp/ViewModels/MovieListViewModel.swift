//
//  MovieListViewModel.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import Foundation
import Combine

final class MovieListViewModel: ObservableObject {
    @Published var selectedMood: MoodOption = .happy
    @Published var selectedMovie: Movie?
    @Published var isLoading = false

    private var cancellables = Set<AnyCancellable>()
    private let service = MovieService()

    func fetchRandomMovie() {
        isLoading = true
        service.fetchMovies(for: selectedMood.genre)
            .sink(receiveCompletion: { [weak self] _ in
                self?.isLoading = false
            }, receiveValue: { [weak self] movies in
                self?.selectedMovie = movies.randomElement()
            })
            .store(in: &cancellables)
    }
}


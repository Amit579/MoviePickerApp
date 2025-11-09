//
//  MoviePickerHomeView.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import SwiftUI

struct MoviePickerHomeView: View {
    @StateObject private var viewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Select Your Mood")
                    .font(.headline)

                Picker("Select Mood", selection: $viewModel.selectedMood) {
                    ForEach(MoodOption.allCases) { mood in
                        Text(mood.rawValue).tag(mood)
                    }
                }
                .pickerStyle(.wheel)
                .padding()

                if viewModel.isLoading {
                    ProgressView("Finding your movie...")
                } else if let movie = viewModel.selectedMovie {
                    MovieCardView(movie: movie)
                }

                Button("Find a Movie") {
                    viewModel.fetchRandomMovie()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 10)
            }
            .navigationTitle("Movie Picker")
        }
    }
}

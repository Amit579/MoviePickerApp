//
//  MovieCardView.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie

    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: movie.posterURL) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 350)
            .cornerRadius(12)

            Text(movie.title)
                .font(.title3)
                .bold()

            Text(movie.overview)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .padding()
    }
}

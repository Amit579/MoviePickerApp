//
//  MoodOption.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import Foundation

enum MoodOption: String, CaseIterable, Identifiable {
    case happy = "Make me laugh"
    case emotional = "Something deep"
    case scared = "Give me chills"
    case adventure = "Family night"
    case thrilling = "Keep me on edge"

    var id: String { rawValue }

    var genre: String {
        switch self {
        case .happy: return "Comedy"
        case .emotional: return "Drama"
        case .scared: return "Horror"
        case .adventure: return "Adventure"
        case .thrilling: return "Thriller"
        }
    }
}

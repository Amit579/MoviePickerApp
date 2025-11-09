//
//  MainTabView.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import SwiftUI

struct MainTabView: View {
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        TabView {
            MoviePickerHomeView()
                .tabItem {
                    Label("Movies", systemImage: "film")
                }

            ProfileView(authViewModel: authViewModel)
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}


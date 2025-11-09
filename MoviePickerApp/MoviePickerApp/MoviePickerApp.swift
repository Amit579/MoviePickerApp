//
//  MoviePickerApp.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import SwiftUI
import SwiftData

@main
struct MoviePickerApp: App {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            RootView(authViewModel: authViewModel)
                .modelContainer(for: UserSession.self)
        }
    }
}

struct RootView: View {
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        Group {
            if authViewModel.isLoggedIn {
                MainTabView(authViewModel: authViewModel)
            } else {
                LoginView(viewModel: authViewModel)
            }
        }
        .onAppear {
            authViewModel.checkSession()
        }
    }
}
 

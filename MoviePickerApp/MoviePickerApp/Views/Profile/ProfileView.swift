//
//  ProfileView.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome, \(authViewModel.mobileNumber)")
                .font(.title3)
            Button("Logout") {
                authViewModel.logout()
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .navigationTitle("Profile")
    }
}

//
//  LoginView.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Login with Mobile Number")
                .font(.title2)

            TextField("Enter mobile number", text: $viewModel.mobileNumber)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Login") {
                viewModel.login()
            }
            .buttonStyle(.borderedProminent)
            .disabled(viewModel.mobileNumber.isEmpty)
        }
        .padding()
        .alert("Invalid Number", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) { }
        }
    }
}


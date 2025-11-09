//
//  AuthViewModel.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import SwiftUI
import SwiftData

final class AuthViewModel: ObservableObject {
    @Published var mobileNumber = ""
    @Published var isLoggedIn = false
    @Published var showError = false

    @Environment(\.modelContext) private var context

    func login() {
        guard !mobileNumber.isEmpty else {
            showError = true
            return
        }

        let session = UserSession(mobileNumber: mobileNumber)
        context.insert(session)
        try? context.save()
        isLoggedIn = true
    }

    func checkSession() {
        let descriptor = FetchDescriptor<UserSession>()
        if let session = try? context.fetch(descriptor).first, session.isValid {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }

    func logout() {
        let descriptor = FetchDescriptor<UserSession>()
        if let session = try? context.fetch(descriptor).first {
            context.delete(session)
            try? context.save()
        }
        isLoggedIn = false
    }
}

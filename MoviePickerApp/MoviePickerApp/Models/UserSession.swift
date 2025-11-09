//
//  UserSession.swift
//  MoviePickerApp
//
//  Created by Wanderer on 09/11/25.
//

import Foundation
import SwiftData

@Model
class UserSession {
    var mobileNumber: String
    var loginDate: Date
    var expiryDate: Date

    init(mobileNumber: String, loginDate: Date = Date()) {
        self.mobileNumber = mobileNumber
        self.loginDate = loginDate
        self.expiryDate = Calendar.current.date(byAdding: .hour, value: 72, to: loginDate)!
    }

    var isValid: Bool {
        Date() < expiryDate
    }
}


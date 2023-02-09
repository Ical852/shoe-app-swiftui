//
//  AuthUser.swift
//  SwiftLearn
//
//  Created by Ahmad Aziz on 21/01/23.
//

import Foundation

class AuthUser: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isCorrect: Bool = true
}

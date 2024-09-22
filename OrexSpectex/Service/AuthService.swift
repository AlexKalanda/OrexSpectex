//
//  AuthService.swift
//  OrexSpectex
//
//  Created by admin on 19/9/2024.
//

import Foundation
import FirebaseAuth

final class AuthService {
    static let shared = AuthService(); private init() {}
    //ссылка на место в базе с авторитизацией
    private let auth = Auth.auth()
    // текущий пользователь
    var currentUser: User? { return auth.currentUser }
    
    
    // метод регестрации в базе
    func signUp(email: String, password: String) async throws -> User {
        let result = try await auth.createUser(withEmail: email, password: password)
        try await FirestoreService.shared.createUser(id: result.user.uid, email: result.user.email!)
        return result.user
    }
    
    // метод для авторитизации
    func signIn(email: String, password: String) async throws -> UserModel {
        let result = try await auth.signIn(withEmail: email, password: password)
        let user = try await FirestoreService.shared.getUser(byId: result.user.uid)
        return user
    }
    
    //выход
    func signOut() throws -> Bool{
        try auth.signOut()
        return true
    }
}

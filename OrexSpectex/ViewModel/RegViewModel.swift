//
//  RegViewMidel.swift
//  OrexSpectex
//
//  Created by admin on 21/9/2024.
//

import Foundation

class RegViewModel: ObservableObject {
    @Published var userId: String? = nil
    // получение пользователя
    func createAccount(login:String,password:String,confirm: String) {
        guard password == confirm else { return }
        
        Task {
            let user = try await AuthService.shared.signUp(email: login, password: password)
            DispatchQueue.main.async {
                self.userId = user.uid
            }
        }
    }
    //метод авторизации
    func authorization(login: String, password: String) {
        Task {
            let user = try await AuthService.shared.signIn(email: login, password: password)
            DispatchQueue.main.async {
                self.userId = user.id
            }
        }
    }
}

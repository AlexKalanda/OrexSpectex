//
//  HomeViewModel.swift
//  OrexSpectex
//
//  Created by admin on 25/6/2024.
//

import Foundation
import FirebaseAuth

class HomeViewModel: ObservableObject {
    let currentUserID: String
    @Published var authorized = true
    @Published var unitHome = CarModel.unitHome
    @Published var dataBase = CarModel.dataBase
    
    init(userId: String) {
        self.currentUserID = userId
        getData()
    }
    
    func getData() {
        
    }
    
    func quit() {
        let result = try! AuthService.shared.signOut()
        guard result == true else { return }
        self.authorized = false
    }
}


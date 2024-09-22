//
//  UserModel.swift
//  OrexSpectex
//
//  Created by admin on 19/9/2024.
//

import Foundation

class UserModel: Identifiable {
    var id: String
    var name : String
    var surname: String
    var number: Int
    var company: String
    var email: String
    var cars: [Car] = []
    
    init(id: String, name: String, surname: String, number: Int, company: String, email: String, cars: [Car] = []) {
        self.id = id
        self.name = name
        self.surname = surname
        self.number = number
        self.company = company
        self.email = email
        self.cars = cars
    }
    
    init?(data: [String: Any]) {
        guard let id = data["id"] as? String,
              let name = data["name"] as? String,
              let surname = data["surname"] as? String,
              let number = data["number"] as? Int,
              let company = data["company"] as? String,
              let email = data["email"] as? String else { return nil }
        
        self.id = id
        self.name = name
        self.surname = surname
        self.company = company
        self.number = number
        self.email = email
    }
    
}

extension UserModel {
    var representation: [String: Any] {
        var representation = [String: Any]()
        representation["id"] = id
        representation["name"] = name
        representation["surname"] = surname
        representation["number"] = number
        representation["company"] = company
        representation["email"] = email
        return representation
    }
}

class Car {
    let status: CarStatus
    let date: Date
    let nameCar: String
    
    init(status: CarStatus, date: Date, nameCar: String) {
        self.status = status
        self.date = date
        self.nameCar = nameCar
    }
    
    enum CarStatus: String {
        case currentReservation = "Забронированная"
        case finished = "Закончила"
    }
}

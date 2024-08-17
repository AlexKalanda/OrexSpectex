//
//  CardViewModel.swift
//  OrexSpectex
//
//  Created by admin on 25/6/2024.
//

import Foundation

class CardViewModel: ObservableObject {
  
    @Published var cars: CarModel
    @Published var dataBase = CarModel.dataBase
    @Published var unitHome = [CarModel]()
    
    init(cars: CarModel) {
        self.cars = cars
        self.unitHome = filter()
    }
    
    func filter() -> [CarModel] {
        dataBase.filter { car in
            car.type == cars.type
        }
    }
}


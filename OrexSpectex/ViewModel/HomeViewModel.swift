//
//  HomeViewModel.swift
//  OrexSpectex
//
//  Created by admin on 25/6/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var unitHome = CarModel.unitHome
    @Published var dataBase = CarModel.dataBase
}


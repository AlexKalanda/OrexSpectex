//
//  DetailCardProdViewModel.swift
//  OrexSpectex
//
//  Created by admin on 12/7/2024.
//

import Foundation

class DetailCardProdViewModel: ObservableObject {
    @Published var model: CarModel
    @Published var selectedEquipments: [CarModel.Equipment] = []
    
    init(model: CarModel) {
        self.model = model
    }
}

//
//  DateViewModel.swift
//  OrexSpectex
//
//  Created by admin on 21/7/2024.
//

import Foundation


class DateViewModel : ObservableObject {
    @Published var model: CarModel
    
    init(model: CarModel) {
        self.model = model
    }
}

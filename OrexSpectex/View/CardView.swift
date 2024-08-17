//
//  CardView.swift
//  OrexSpectex
//
//  Created by admin on 24/6/2024.
//

import SwiftUI

struct CardView: View {
    var mainViewModel: CardViewModel
    @State private var coloumns = [
        GridItem(.flexible(),spacing: 0),
        
    ]
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(.orange)
                    .frame(maxWidth: .infinity)
                    .frame(height: 0)
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: coloumns, spacing: 50) {
                        ForEach(mainViewModel.unitHome) { car in
                            DetailCardProductView(mainViewModel: .init(model: car))
                                .onTapGesture {
                                    print(car.id)
                                }
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    CardView(mainViewModel: .init(cars: .init(type: .backhoeLoader, title: "", image: "STH", stateNumber: "", equipment: [.ladle], description: "",dates: .now,endDate: .now, free: true)))
//}

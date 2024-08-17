//
//  CardProductView.swift
//  OrexSpectex
//
//  Created by admin on 21/6/2024.
//

import SwiftUI

struct CardProductView: View {
    var images: String
    var title: String
    var body: some View {
        VStack{
            VStack {
                Image(images)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 130)
            }
            .clipped()
            .background()
            .clipShape(.buttonBorder)
            .shadow(color: .black, radius: 5)
            
            Text(title)
                .multilineTextAlignment(.center)
                .bold()
                .foregroundStyle(.white)
                .lineLimit(3, reservesSpace: true)
        }
        .frame(width: 180,height: 153)
    }
}

#Preview {
    CardProductView(images: "jac", title: "jac")
}

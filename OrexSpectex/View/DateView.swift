//
//  DataView.swift
//  OrexSpectex
//
//  Created by admin on 21/7/2024.
//

import SwiftUI

struct DateView: View {
    @StateObject var viewModel: DateViewModel
    
    @State var selectDate = Set<DateComponents>()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("\(viewModel.model.stateNumber)")
                .foregroundStyle(.white)
            MultiDatePicker("", selection: $selectDate, in: Date()...)
                .datePickerStyle(.graphical)
                .padding()
                .background(.orange)
                .cornerRadius(30)
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Подтвердить").bold()
                        .frame(width: 120)
                        .padding()
                        .background(.green)
                        .cornerRadius(20)
                     
                })
                Spacer()
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Отменить").bold()
                        .frame(width: 120)
                        .padding()
                        .background(.red)
                        .cornerRadius(20)
                })

            }
            .foregroundStyle(.black)
            .padding(.vertical)
        }
        .padding(.horizontal)
        .padding(.top, 30)
        .frame(maxHeight: .infinity,alignment: .top)
        .background(.black)
    }
}

//#Preview {
//    DateView(viewModel: .init(model: .init(type: .backhoeLoader, title: "jcb", image: "jcb", stateNumber: "", equipment: [], description: "", dates: .now, endDate: .now, free: true)))
//}

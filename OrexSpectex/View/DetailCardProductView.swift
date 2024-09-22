//
//  DatailCardProductView.swift
//  OrexSpectex
//
//  Created by admin on 21/6/2024.
//

import SwiftUI

struct DetailCardProductView: View {
    @StateObject var mainViewModel: DetailCardProdViewModel
    
    @State private var isShowEquipment = false
    @State private var isShowDescription = false
    // @State private var isPresentButtonEquipment: Bool
    @State private var isShowDateView = false
    
    var body: some View {
        VStack {
            Image(mainViewModel.model.image)
                .resizable()
                .clipShape(.rect(cornerRadius: 10))
                .padding(8)
                .background(.green)
                .clipShape(.rect(cornerRadius: 10))
                .shadow(color: .black, radius: 5,x: 2,y: 2)
                .frame(width: 350,height: 250)
            
            Text(mainViewModel.model.title)
                .bold()
            
            Text("Гос. номер: \(mainViewModel.model.stateNumber)")
                .bold()
            
            Button(action: {
                isShowDateView.toggle()
            }, label: {
                Text("Забронировать")
                    .frame(width: 300,height: 40)
                    .background(.orange)
                    .clipShape(.capsule)
                    .tint(.white)
            })
            if !mainViewModel.model.equipment.isEmpty {
                Button(action: {
                    isShowEquipment.toggle()
                }, label: {
                    HStack {
                        Text("Оборудование")
                        Image(systemName: isShowEquipment ? "chevron.up" : "chevron.down")
                    }
                })
                .padding(.bottom,8)
                
                if isShowEquipment {
                    VStack(alignment: .leading) {
                        ForEach(mainViewModel.model.equipment,id: \.self) { i in
                            VStack {
                                HStack {
                                    Text(i.rawValue)
                                    Spacer()
                                    Button {
                                        if mainViewModel.selectedEquipments.contains(i) {
                                            if let index = mainViewModel.selectedEquipments.firstIndex(of: i) {
                                                mainViewModel.selectedEquipments.remove(at: index)
                                            }
                                        } else {
                                            mainViewModel.selectedEquipments.append(i)
                                        }
                                    } label: {
                                        
                                        Rectangle()
                                            .stroke(lineWidth: 1.0)
                                            .frame(width: 15,height: 15)
                                            .overlay {
                                                if mainViewModel.selectedEquipments.contains(i) {
                                                    Image(systemName: "checkmark")
                                                }
                                            }
                                    }
                                }
                            }
                        }
                    }
                    .frame(width: 120)
                }
            }
            Button(action: {
                isShowDescription.toggle()
            }, label: {
                HStack {
                    Text("Характеристики")
                    Image(systemName: isShowDescription ? "chevron.up" : "chevron.down")
                }
            })
            .padding(.bottom,4)
            
            if isShowDescription {
                ScrollView(.vertical,showsIndicators: true) {
                    Text(mainViewModel.model.description)
                        .padding(.horizontal,26)
                }
                .frame(height: 150)
            }
            
            Divider()
                .overlay(Color.white)
            
        }
        .background(.black)
        .foregroundStyle(.white)
        .animation(.easeInOut, value: isShowDescription)
        
        .sheet(isPresented: $isShowDateView, content: {
            DateView(viewModel: .init(model: mainViewModel.model))
                .presentationDetents([.height(600 )])
        })
    }  
}

//#Preview {
//    DetailCardProductView( mainViewModel: .init(model: .init(type: .backhoeLoader, title: "Экскаватор погрузчик JCB", image: "jcb1", stateNumber: "ВВ4743 77", equipment: [.blowdown,.brush,.concreteBreaker,.cradle], description: "Эксплуатационная мощность - 74,6 кВт.Модель двигателя - 1104C 44T.  Эксплуатационная масса - 8700 кг.Тип / Емкость погрузочного ковша - 4 в 1 / 1,1 м3.Ширина ковша - 2280 мм.Объем экскаваторного ковша - 0,25 м3.Стрела (тип)    телескопическая обратная лопата.Транспортная длина - 6220 мм.Высота в транспортном положении - 3760 мм.Максимальная ширина - 2280 мм. Глубина копания - 5800 мм. Высота выгрузки - 3850 мм",dates: .now,endDate: .now, free: true)))
//}




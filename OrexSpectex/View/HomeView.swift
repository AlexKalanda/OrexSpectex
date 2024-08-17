//
//  ContentView.swift
//  OrexSpectex
//
//  Created by admin on 21/6/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var maimViewModel = HomeViewModel()
    @State private var coloumns = [
        GridItem(.flexible(),spacing: 0),
        GridItem(.flexible(),spacing: 0)
    ]
    @State private var isPresentMenu = false
   // var cardProduct: CarModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Rectangle()
                        .ignoresSafeArea()
                        .foregroundStyle(.orange)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .overlay(alignment: .bottom) {
                            HStack {
                                Button(action: {
                                    self.isPresentMenu.toggle()
                                }, label: {
                                    Image(systemName: "text.justify")
                                })
                                .tint(.black)
                                .padding(.horizontal,10)
                                
                                Spacer()
                                
                                Text("Имя Фамилия")
                                
                                Spacer()
                                
                                Image(.ava)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35,height: 35)
                                    .clipShape(.circle)
                                    .padding(2)
                                
                            }
                            .foregroundStyle(.white)
                            .padding(.horizontal,10)
                        }
                    
                    ScrollView(.vertical) {
                        LazyVGrid(columns: coloumns, spacing: 10) {
                            ForEach(maimViewModel.unitHome) { cars in
                                NavigationLink {
                                    let viewModel = CardViewModel(cars: cars)
                                    CardView(mainViewModel: viewModel)
                                } label: {
                                    CardProductView(images: cars.image, title: cars.title)
                                }
                            }
                            .padding(20)
                        }
                    }
                }
            }
        }
    
        .overlay {
            if isPresentMenu  {
                Rectangle()
                    .ignoresSafeArea()
                    .opacity(0.8)
                    .animation(.snappy(duration: 1),value: isPresentMenu)
                    .onTapGesture {
                        isPresentMenu = false
                    }
            }
        }
        .overlay {
            MenuView()
                .offset(x: isPresentMenu ? -72 : -700)
                .animation(.easeInOut(duration: 0.3), value: isPresentMenu)
            
        }
        
    }
    @ViewBuilder
    func MenuView() -> some View {
        VStack {
            HStack {
                Button(action: {
                    self.isPresentMenu.toggle()
                }, label: {
                    Image(systemName: "chevron.left")
                        .tint(.black)
                })
                .padding()
                Spacer()
            }
            Image(.ava)
                .resizable()
                .frame(width: 80, height: 80)
                .clipped()
                .clipShape(.circle)
            Text("Имя Фамилия")
                .padding(.bottom,200)
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image("reserved")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(.green)
                    Text("Забронированная техника")
                        .tint(.black)
                }
            })
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text("Настройка профиля")
                }
                .padding(.leading)
                .tint(.black)
            })
            
            Spacer()
        }
        .frame(width: 250)
        .frame(maxHeight: .infinity)
        .background(.orange)
    }
}



#Preview {
    HomeView()
}

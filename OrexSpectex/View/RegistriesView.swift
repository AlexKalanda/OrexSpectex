//
//  RegistriesView.swift
//  OrexSpectex
//
//  Created by admin on 27/6/2024.
//

import SwiftUI

struct RegistriesView: View {
    @EnvironmentObject var contentViewmodel: ContentViewModel
    @StateObject var viewModel = RegViewModel()
    @State private var isShowLogIn = true
    @State private var isShowHomeView = false
    @State private var email = ""
    @State private var name = ""
    @State private var surname = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var company = ""
    @State private var isShowAlert = false
    @State private var alertMes = ""
    var body: some View {
        VStack {
            VStack {
                
                Text(isShowLogIn ? "Авторизация" : "Регестрация")
                    .padding()
                    .frame(width: 200,height: 50)
                    .opacity(0.3)
                    .padding(.top)
                if isShowLogIn {
                    TextField("Введите логин", text: $email)
                        .padding()
                        .background(.white)
                        .clipShape(.capsule)
                    SecureField("Введите ваш пароль", text: $password)
                        .padding()
                        .background(.white)
                        .clipShape(.capsule)
                }
                
                if !isShowLogIn {
                    TextField("Введите организацию", text: $company)
                        .padding(4)
                        .background(.white)
                        .clipShape(.capsule)
                    TextField("Введите имя", text: $name)
                        .padding(4)
                        .background(.white)
                        .clipShape(.capsule)
                    TextField("Введите фамилию", text: $surname)
                        .padding(4)
                        .background(.white)
                        .clipShape(.capsule)
                    TextField("Введите email", text: $email)
                        .padding(4)
                        .background(.white)
                        .clipShape(.capsule)
                    SecureField("Введите ваш пароль", text: $password)
                        .padding(4)
                        .background(.white)
                        .clipShape(.capsule)
                    SecureField("Подтвердите пароль", text: $confirmPassword)
                        .padding(4)
                        .background(.white)
                        .clipShape(.capsule)
                }
                
                Spacer()
               
                Button(action: {
                    switch isShowLogIn {
                        case true:
                        viewModel.authorization(login: email, password: password)
                    case false:
                        viewModel.createAccount(login: email, password: password, confirm: confirmPassword)
                    }
                }, label: {
                    Text(isShowLogIn ? "Войти" : "Регестрация")
                        .frame(width: 200,height: 50)
                        .background(.black)
                        .clipShape(.capsule)
                        .padding(.bottom,4)
                        .tint(.white)
                })
                    Button(action: {
                        isShowLogIn.toggle()
                    }, label: {
                        Text(isShowLogIn  ? "Создать аккаунт" : "Уже есть аккаунт")
                            .frame(width: 200,height: 50)
                            .tint(.black)
                         
                    })
                    Spacer()
                    
                
            }
            .padding()
            .frame(width: 300)
            .frame(height: isShowLogIn ? 350 : 420)
            .background(.orange)
            .clipShape(.rect(cornerRadius: 20))
        }
        .onChange(of: viewModel.userId) { oldValue, newValue in
            guard let newValue else {
                contentViewmodel.appState = .unauthorized
                return
            }
            contentViewmodel.appState = .authorized(id: newValue)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.black)
        .animation(.easeInOut, value: isShowLogIn)
    }
}



#Preview {
    RegistriesView()
}

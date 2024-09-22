//
//  ProfileViewModel.swift
//  OrexSpectex
//
//  Created by admin on 20/9/2024.
//

import Foundation

//class ProfileViewModel: ObservableObject {
//    
//    @Published var profile: UserModel
//    
//    init(profile: UserModel) {
//        self.profile = profile
//    }
//    //установка пользователя
//    func setProfile() {
//        DataBaseService.shared.setProfile(user: self.profile) { result in
//            switch result {
//            case .success(let user):
//                print(user.name)
//            case .failure(_):
//                print("ошибка отправки данных")
//            }
//        }
//    }
//    //получение пользователя
//    func getProfile() {
//        DataBaseService.shared.getProfile { result in
//            switch result {
//            case .success(let user):
//                self.profile = user
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//}

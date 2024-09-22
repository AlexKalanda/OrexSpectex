//
//  OrexSpectexApp.swift
//  OrexSpectex
//
//  Created by admin on 21/6/2024.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct OrexSpectexApp: App {
    //свойство для связки с классом
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    // функция которая связывает приложение и базу данных
    class AppDelegate: NSObject, UIApplicationDelegate {
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            print("конфигурация прошла успешно")
            return true
        }
    }
    
}

//
//  SecureAuthApp.swift
//  SecureAuth
//
//  Created by Charles Martin Martinière on 16/06/2024.
//

import SwiftUI
import Firebase
@main
struct SecureAuthApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print ("Configured Firebase")
        return true
    }
}

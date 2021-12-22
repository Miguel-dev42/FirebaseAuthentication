//
//  FirebaseAuthenticationTestsApp.swift
//  FirebaseAuthenticationTests
//
//  Created by Miguel Figueroa on 11/19/21.
//

import SwiftUI
import Firebase

@main
struct FirebaseAuthenticationTestsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = EmailSignInViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil ) -> Bool {
//
//        FirebaseApp.configure()
//
//        return true
//    }
}

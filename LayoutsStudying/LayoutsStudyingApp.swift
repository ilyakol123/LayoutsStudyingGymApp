//
//  LayoutsStudyingApp.swift
//  LayoutsStudying
//
//  Created by Илья Колесников on 21.04.2025.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      Auth.auth().useEmulator(withHost: "localhost", port: 9099)
    return true
  }
}

@main
struct LayoutsStudyingApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
           
           ContentView()
        }
    }
}

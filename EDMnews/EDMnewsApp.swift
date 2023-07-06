//
//  EDMnewsApp.swift
//  EDMnews
//
//  Created by Chris on 7/5/23.
//

import SwiftUI
import FirebaseCore
import Firebase


@main
struct FBAuth1App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var signInViewModel = SignInViewModel()

    var body: some Scene {
        WindowGroup {
            SignIn()
                .environmentObject(signInViewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
}

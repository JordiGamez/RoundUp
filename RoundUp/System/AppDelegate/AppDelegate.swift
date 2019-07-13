//
//  AppDelegate.swift
//  RoundUp
//
//  Created by Jordi Gámez on 13/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Public variables
    
    var window: UIWindow?

    // MARK: Public methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setInitialScreen()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
    
    // MARK: Private methods
    
    /// Set initial screen
    private func setInitialScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let roundUpViewController = RoundUpViewController()
        window?.rootViewController = roundUpViewController
        window?.makeKeyAndVisible()
    }
}

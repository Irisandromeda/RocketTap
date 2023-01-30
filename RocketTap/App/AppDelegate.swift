//
//  AppDelegate.swift
//  RocketTap
//
//  Created by Irisandromeda on 27.01.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = MenuViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

}

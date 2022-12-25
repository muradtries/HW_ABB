//
//  AppDelegate.swift
//  MemoryLeakage
//
//  Created by Murad on 24.12.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UINavigationController(rootViewController: FirstViewController())
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
    }
}


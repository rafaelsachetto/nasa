//
//  AppDelegate.swift
//  Nasa
//
//  Created by Rafael Sachetto on 20/04/19.
//  Copyright © 2019 Rafael Sachetto. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = .init(frame: UIScreen.main.bounds)

        let vc: ListImagesViewController = .init()
        let nvc: UINavigationController = .init(rootViewController: vc)

        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
        return true
    }

}


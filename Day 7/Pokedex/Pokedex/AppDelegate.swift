//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Pierce Tu on 10/28/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        
        let leftNavController = splitViewController.viewControllers.first as! UINavigationController
        let masterViewController = leftNavController.topViewController as! MasterVC
        
        return true
    }

}


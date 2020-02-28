//
//  AppDelegate.swift
//  CandySearch
//
//  Created by Pierce Tu on 10/18/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self

        // unknown
        UISearchBar.appearance().barTintColor = UIColor.black
        // cancel button
        UISearchBar.appearance().tintColor = UIColor.black
        // cursor in search bar
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.black
        return true    }

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailCandy == nil {

            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}


//import UIKit
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {
//
//  var window: UIWindow?
//
//  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    // Override point for customization after application launch.
//    let splitViewController = window!.rootViewController as! UISplitViewController
//    let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
//    navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
//    splitViewController.delegate = self
//
//    UISearchBar.appearance().barTintColor = UIColor.candyGreen()
//    UISearchBar.appearance().tintColor = UIColor.white
//    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.candyGreen()
//    return true
//  }
//
//  // MARK: - Split view
//  func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
//    guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
//    guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
//    if topAsDetailController.detailCandy == nil {
//      // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
//      return true
//    }
//    return false
//  }
//
//}
//
//extension UIColor {
//  static func candyGreen() -> UIColor {
//    return UIColor(red: 67.0/255.0, green: 205.0/255.0, blue: 135.0/255.0, alpha: 1.0)
//  }
//}

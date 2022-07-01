//
//  AppDelegate.swift
//  peopart-app
//
//  Created by Leo Dion on 5/30/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import UIKit

#if USE_UIKIT
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
}
#else
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
}
#endif
extension AppDelegate {



  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let tabBarController = UITabBarController(navigationRootViewControllers: [UsersTableViewController(), PostsTableViewController()])
    let window = UIWindow.makeWindow(keyAndVisibleWithViewController: tabBarController)
    self.window = window
    // create tab bar view controller with one tab for the users list
    // parse the json file for users, posts, and comments
    // implement the user fetch operation
    // setup the table cell for users
    // display the users in a table
    
    /**
    concepts:
     * Basic UI Elements
     * Optionals
     * try catch throw
     * Structs vs Classes
     * Protocols
     * Enums
     * Extensions
     * Codable
     * Closures
     * UITableView     
    */
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}


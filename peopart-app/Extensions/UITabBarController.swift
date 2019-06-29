//
//  UITabBarController.swift
//  workshop app
//
//  Created by Leo Dion on 5/26/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import UIKit

extension UITabBarController {
  /**
   Convenience which automatically creates a `UINavigationController` for each `UIViewController` and
   sets up the `tabItem` if it implements `TabItemable`.
   
   - Parameter navigationRootViewControllers: the `UIViewControllers` which will be the `rootViewController` for each `UINavigationController`
   - Parameter animated: whether to animate setting up the `UIViewControllers`
   */
  convenience init(navigationRootViewControllers: [UIViewController], animated : Bool = false) {
    self.init()
    
    let viewControllers = navigationRootViewControllers.map
    { rootViewController -> UIViewController in
      let viewController = UINavigationController(rootViewController: rootViewController)
      if let tabItemable = rootViewController as? TabItemable {
        tabItemable.configureTabItem(viewController.tabBarItem)
      }
      return viewController
    }
    self.setViewControllers(viewControllers, animated: animated)
  }
}

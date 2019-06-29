//
//  TabItemable.swift
//  workshop app
//
//  Created by Leo Dion on 5/26/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import UIKit

/**
 Protocol which simplifies setting up the tabItem for a `UIViewController`
*/
protocol TabItemable {
  /**
   Configure the `tabItem` for a `UITabBarController`.
   
   - Parameter tabItem: the `tabItem` to configure
   */
  func configureTabItem(_ tabItem : UITabBarItem)
}

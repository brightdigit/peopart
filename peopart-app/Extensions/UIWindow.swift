//
//  UIWindow.swift
//  workshop app
//
//  Created by Leo Dion on 5/26/19.
//  Copyright © 2019 Leo Dion. All rights reserved.
//

import UIKit

extension UIWindow {
  /**
   Method which creates a `UIWindow`, set the `rootViewController`, and makes it key and visible
   
   - Parameter rootViewController: the `rootViewController` of the new `UIWindow`
  */
  static func makeWindow(keyAndVisibleWithViewController rootViewController: UIViewController?) -> UIWindow {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
    return window
  }
}

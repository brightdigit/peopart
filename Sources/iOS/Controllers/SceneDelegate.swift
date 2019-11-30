//
//  SceneDelegate.swift
//  Peopart_iOS_Application
//
//  Created by Leo Dion on 11/28/19.
//

import UIKit
import SwiftUI

class SceneDelegate : UIResponder, UIWindowSceneDelegate {
  var window : UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(DataObject(source: .bundle(Bundle(for: type(of: self)), withResource: "db", andExtension: "json"))))
      self.window = window
      window.makeKeyAndVisible()
    }
  }
}

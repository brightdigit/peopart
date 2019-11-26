import UIKit
import SwiftUI

struct ContentView : View {
  var body: some View {
    Text("Hello World")
  }
}

class SceneDelegate : UIResponder, UIWindowSceneDelegate {
  var window : UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: ContentView())
      self.window = window
      window.makeKeyAndVisible()
    }
  }
}

public class AppDelegate : UIResponder, UIApplicationDelegate {
  public func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    var configuration = UISceneConfiguration()
    configuration.delegateClass = SceneDelegate.self
    return configuration
  }
}

public class PeopartApplication : UIApplication {
  
}

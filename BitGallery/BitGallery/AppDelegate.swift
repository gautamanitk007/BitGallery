//
//  AppDelegate.swift
//  BitGallery
//
//  Created by Gautam Kumar Singh on 3/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UIWindowSceneDelegate {

    static var configuration: Configuration!
    var window: UIWindow?
    var api:API!
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .systemBlue
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UIBarButtonItem.appearance().tintColor = .white
        AppDelegate.configuration = Configuration.load()
        self.api = API(server: AppDelegate.configuration.server)
        
        return true
    }
}

extension UIApplication {
  static var appDelegate: AppDelegate { return self.shared.delegate as! AppDelegate}
}

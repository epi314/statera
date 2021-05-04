//
//  AppDelegate.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow()
    window?.makeKeyAndVisible()
    
    window?.rootViewController = ViewController()
    
    return true
  }
}


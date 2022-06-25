//
//  AppDelegate.swift
//  RickandMortySample
//
//  Created by Onur Şimşek on 13.06.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.rootViewController = UINavigationController(rootViewController: MainScreenViewController())
        window?.makeKeyAndVisible()
        
        return true
    }


}



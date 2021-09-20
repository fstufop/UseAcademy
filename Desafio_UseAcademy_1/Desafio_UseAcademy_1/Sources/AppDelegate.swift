//
//  AppDelegate.swift
//  Desafio_UseAcademy_1
//
//  Created by BootCamp on 19/09/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                

        let viewController = HomeViewController()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
       
        return true
    }
}


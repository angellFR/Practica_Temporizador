//
//  AppDelegate.swift
//  Practica_TEMPORIZADOR
//
//  Created by Administrator on 05/07/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
//        let vc = HomeRouter.createModule()
//        let vc = ContainerViewController()
//        let vc = CoreMotionViewController()
        let vc = VibrationPruebaViewController()
//        let vc = ConfigurationViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        return true

    }


}


//
//  AppDelegate.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: Coordinator?
    private lazy var navigationController = UINavigationController().with {
        $0.navigationBar.isTranslucent = false
        $0.navigationBar.isHidden = true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupRootCoordinator()
        
        return true
    }

    private func setupRootCoordinator() {
        coordinator = ApplicationCoordinator(navigationController: navigationController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
        
        coordinator?.start()
    }
}


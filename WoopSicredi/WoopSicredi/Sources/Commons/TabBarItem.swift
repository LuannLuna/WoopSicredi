//
//  TabBarItem.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case events = 0
    
    static var numberOfItens: Int {
        allCases.count
    }
    
    var title: String {
        switch self {
        case .events:
            return "Eventos"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .events:
            return #imageLiteral(resourceName: "event")
        }
    }
    
    var navigationController: UINavigationController {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationItem.largeTitleDisplayMode = .automatic
        
        return navigationController
    }
    
    var item: UITabBarItem {
        let tabbarItem = UITabBarItem(title: title, image: icon, selectedImage: icon)
        tabbarItem.imageInsets = UIEdgeInsets(top: -2, left: 0, bottom: 2, right: 0)
        
        return tabbarItem
    }
    
    func coordinator() -> Coordinator? {
        var coordinator: Coordinator?
        
        switch self {
        case .events: coordinator = EventsCoordinator(navigationController: navigationController)
        }
        
        coordinator?
            .rootViewController?
            .tabBarItem = self.item
        
        return coordinator
    }
}

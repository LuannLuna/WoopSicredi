//
//  MainViewController.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import UIKit

protocol MainViewControllerDelegate: class { }

class MainViewController: UITabBarController, MainViewControllerDelegate {
    var viewModel: MainViewModelType?
    
    init(viewModel: MainViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        delegate = self
    }
}

extension MainViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let selectedViewController = viewControllers?[selectedIndex] {
            if selectedViewController === viewController {
                if let navigationController = viewController as? UINavigationController {
                    if navigationController.viewControllers.count == 1 {
//                        if let scrollable = navigationController.viewControllers.first as? Scrollable {
//                            scrollable.scrollToTop()
//                        }
                    }
                }
            }
        }
        return true
    }
}


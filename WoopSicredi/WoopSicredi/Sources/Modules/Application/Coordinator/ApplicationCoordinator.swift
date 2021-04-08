//
//  ApplicationCoordinator.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import UIKit

protocol ApplicationCoordinatorProtocol: Coordinator {
    func didSetupFinished()
}

class ApplicationCoordinator: ApplicationCoordinatorProtocol {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.childCoordinators = []
    }
    
    func start() {
        let module = loadViewController()
        navigationController.setViewControllers([module], animated: true)
    }
    
    func didSetupFinished() {
        let coordinator = MainCoordinator(navigationController: navigationController)
        addChild(coordinator)
        coordinator.start()
    }
    
    private func loadViewController() -> UIViewController {
        let viewModel = ApplicationViewModel()
        let viewController = ApplicationViewController(viewModel: viewModel)
        
        viewModel.coordinator = self
        
        return viewController
    }
}


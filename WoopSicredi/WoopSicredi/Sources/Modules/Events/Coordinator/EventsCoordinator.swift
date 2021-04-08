//
//  EventsCoordinator.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

import UIKit

protocol EventsCoordinatorDelegate: Coordinator {
    func showEventDetail(event: Event)
}

class EventsCoordinator: EventsCoordinatorDelegate {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        childCoordinators = []
    }
    
    func start() {
        let module = loadViewController()
        navigationController.pushViewController(module, animated: true)
    }
    
    private func loadViewController() -> UIViewController {
        let viewModel = EventsViewModel()
        let viewController = EventsViewController()
        
        viewController.viewModel = viewModel
        viewModel.coordinator = self
        
        return viewController
    }
    
    func showEventDetail(event: Event) {
        let coordinator = EventDetailCoordinator(navigationController: navigationController, event: event)
        coordinator.coordinatorDelegate = self
        addChild(coordinator)
        coordinator.start()
    }
}

extension EventsCoordinator: CoordinatorDelegate {}

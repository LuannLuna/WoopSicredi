//
//  EventDetailCoordinator.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import UIKit

public protocol EventDetailCoordinatorType: Coordinator {
    func onFinish()
    func didTappedCheckinButton()
}

class EventDetailCoordinator: EventDetailCoordinatorType {
    
    var childCoordinators: [Coordinator]
    var navigationController: UINavigationController
    weak var coordinatorDelegate: CoordinatorDelegate?
    let event: Event
    
    init(navigationController: UINavigationController, event: Event) {
        self.navigationController = navigationController
        self.event = event
        childCoordinators = []
    }
    
    func start() {
        let module = loadViewController()
        navigationController.pushViewController(module, animated: true)
    }
    
    private func loadViewController() -> UIViewController {
        let viewModel = EventDetailViewModel(event)
        let viewController = EventDetailViewController()
        
        viewModel.coordinator = self
        viewModel.view = viewController
        viewController.viewModel = viewModel
        
        return viewController
    }
    
    func onFinish() {
        coordinatorDelegate?.onCoordinatorFinish(self)
    }
    
    func didTappedCheckinButton() {
        let viewModel = CheckinViewModel(event)
        let viewController = CheckinViewController()
        
        viewController.viewModel = viewModel
        viewModel.view = viewController
        
        navigationController.present(viewController, animated: true, completion: nil)
    }
}

extension EventDetailCoordinator: CoordinatorDelegate {}

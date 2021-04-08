//
//  EventDetailViewModel.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

public protocol EventDetailViewModelType: class {
    var title: String { get }
    var description: String { get }
    var coordination: (Double, Double) { get }
    func viewDidAppear()
    func onFinish()
    func checkinButtonDidTapped()
}

class EventDetailViewModel: EventDetailViewModelType {
    
    weak var coordinator: EventDetailCoordinatorType?
    weak var view: EventDetailViewControllerDelegate?
    
    let event: Event
    
    init(_ event: Event) {
        self.event = event
    }
    
    var title: String { event.title }
    var description: String { event.description }
    var coordination: (Double, Double) { (event.latitude, event.longitude) }
    
    func viewDidAppear() {
        view?.configure(event)
    }
    
    func onFinish() {
        coordinator?.onFinish()
    }
    
    func checkinButtonDidTapped() {
        coordinator?.didTappedCheckinButton()
    }
}

//
//  EventsViewModel.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

protocol EventsViewModelType: class {
    var numberOfEvents: Int { get }
    func didTapElement(at index: Int)
    func elementAt(index: Int) -> Event?
    func fetchData(completion: CompletionHandler?)
}

class EventsViewModel: EventsViewModelType {
    
    var service: EventsServiceProtocol
    weak var coordinator: EventsCoordinatorDelegate?
    
    private var events: [Event]
    
    init(service: EventsServiceProtocol = EventsService(query: EventsQuery.all)) {
        self.service = service
        events = []
    }
    
    var numberOfEvents: Int {
        return events.count
    }
    
    func fetchData(completion: CompletionHandler?) {
        service.doRequest { [weak self] (result: Result<[Event], NetworkError>) in
            switch result {
            case .success(let events):
                self?.events = events
                completion?()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func elementAt(index: Int) -> Event? {
        events.element(at: index)
    }
    
    func didTapElement(at index: Int) {
        if let event = events.element(at: index) {
            coordinator?.showEventDetail(event: event)
        }
    }
}

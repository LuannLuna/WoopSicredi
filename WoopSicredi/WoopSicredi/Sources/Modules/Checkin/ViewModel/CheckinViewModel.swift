//
//  CheckinViewModel.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

public protocol CheckinViewModelType: class {
    func viewDidAppear()
    func setName(_ name: String?)
    func setEmail(_ email: String?)
    func doCheckin()
}

class CheckinViewModel: CheckinViewModelType {
    var view: CheckinViewControllerDelegate?
    let event: Event
    var service: EventsServiceProtocol?
    var name: String?
    var email: String?
    
    init(_ event: Event) {
        self.event = event
    }
    
    func viewDidAppear() {
        view?.configure(event)
    }
    
    func setName(_ name: String?) {
        self.name = name
    }
    
    func setEmail(_ email: String?) {
        self.email = email
    }
    
    func doCheckin() {
        guard let name = name, let email = email else { return }
        service = EventsService(query: EventsQuery.checkin(checkin: Checkin(email: email, name: name, id: event.id)))
        
        service?.doRequest(callback: { [weak self] (result: Result<CheckinResponse, NetworkError>) in
            switch result {
            case .failure(let msg):
                self?.view?.failure(msg: msg.localizedDescription)
            case .success:
                self?.view?.success()
            }
        })
    }
}

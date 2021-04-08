//
//  EventsServices.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

public typealias EventsCallback = (Result<[Event], NetworkError>) -> Void

public protocol EventsServiceProtocol {
    func fetchEventsData(callback: @escaping EventsCallback)
}

public class EventsService: EventsServiceProtocol {
    
    private var network: NetworkProtocolType
    var query: EventsQuery
    
    public init(network: NetworkProtocolType = Network.shared, query: EventsQuery) {
        self.network = network
        self.query = query
    }
    
    public func fetchEventsData(callback: @escaping EventsCallback) {
        network.call(query, [Event].self) { result in
            switch result  {
            case .success(let response):
                callback(.success(response))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

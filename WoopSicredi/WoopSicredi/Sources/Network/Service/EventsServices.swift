//
//  EventsServices.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

public protocol EventsServiceProtocol {
    func doRequest<T: Decodable>(callback: @escaping ((Result<T, NetworkError>) -> Void))
}

public class EventsService: EventsServiceProtocol {
    
    private var network: NetworkProtocolType
    var query: EventsQuery
    
    public init(network: NetworkProtocolType = Network.shared, query: EventsQuery) {
        self.network = network
        self.query = query
    }
    
    public func doRequest<T: Decodable>(callback: @escaping ((Result<T, NetworkError>) -> Void)) {
        network.call(query, T.self) { result in
            switch result  {
            case .success(let response):
                callback(.success(response))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}

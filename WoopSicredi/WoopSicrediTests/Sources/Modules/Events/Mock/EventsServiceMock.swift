//
//  EventsServiceMock.swift
//  WoopSicrediTests
//
//  Created by Luann Marques Luna on 09/04/21.
//

import Foundation

@testable import WoopSicredi

public class EventsServiceMock: EventsServiceProtocol {
    
    var result: ResultCase
    
    init(result: ResultCase) {
        self.result = result
    }
    
    public func doRequest<T: Decodable>(callback: @escaping ((Result<T, NetworkError>) -> Void)) {
        switch result {
        case .failure:
            callback(.failure(NetworkError.dataNotFound))
        case .success:
            callback(.success(LocalFileJSON.get("Events")))
        }
    }
}

//
//  Network.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import Foundation

public final class Network: NetworkProtocol {
    
    var endpoint: URL? { URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/") }
    var session: URLSession?
    
    public static var shared: NetworkProtocolType = Network()
    
    internal lazy var sessionRest: URLSession? = {
        let client = URLSession(configuration: .default)
        return client
    }()
    
    public func call<T: RestQuery, U: Decodable>(_ query: T,
                                                 _ decodable: U.Type,
                                                 _ completion: @escaping NetworkCompletion<U>) {
        
        guard let endpoint = endpoint else { return }
        
        let urlRequest = query.asURLRequest(endpoint)
        
        sessionRest?.dataTask(with: urlRequest) { data, _, error in
            completion(self.handle(data, error))
        }.resume()
    }
}

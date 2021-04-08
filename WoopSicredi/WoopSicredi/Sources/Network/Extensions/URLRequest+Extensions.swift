//
//  URLRequest+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import Foundation

extension URLRequest {
    
    mutating func appendHttpMethod(_ method: NetworkMethod) {
        httpMethod = method.rawValue
    }

    func appendingHttpMethod(_ method: NetworkMethod) -> URLRequest {
        
        var urlRequest = self
        urlRequest.appendHttpMethod(method)
        
        return urlRequest

    }
    
    mutating func appendHttpBody(_ body: [String: Any]?) {
        
        guard let body = body else { return }
        let bodyData = try? JSONSerialization.data(withJSONObject: body,
                                                   options: .prettyPrinted)
        
        httpBody = bodyData
    }

    func appendingHttpBody(_ body: [String: Any]?) -> URLRequest {
        
        var urlRequest = self
        urlRequest.appendHttpBody(body)
        
        return urlRequest
    }
}

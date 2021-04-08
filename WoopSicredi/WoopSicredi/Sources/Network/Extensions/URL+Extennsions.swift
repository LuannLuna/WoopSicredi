//
//  URL+Extennsions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import Foundation

extension URL {
    
    mutating func appendPathParameters(_ parameters: [String: String]?) {
        
        guard let parameters = parameters else { return }
        
        var urlComponents = URLComponents(url: self,
                                          resolvingAgainstBaseURL: true)
        
        urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        self = urlComponents?.url ?? self
        
    }

    func appendingPathParameters(_ parameters: [String: String]?) -> URL {

        var url = self
        url.appendPathParameters(parameters)
        
        return url

    }
}

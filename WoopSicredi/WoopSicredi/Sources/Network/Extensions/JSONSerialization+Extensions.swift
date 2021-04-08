//
//  JSONSerialization+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import Foundation

extension JSONSerialization {
    
    convenience init(_ jsonObject: Any) {
        self.init()
    }
    
    static func data(_ jsonObject: Any?) -> Data? {
        guard let jsonObject = jsonObject else { return nil }
        return try? data(withJSONObject: jsonObject, options: .prettyPrinted)
    }
    
    static func jsonObject(_ data: Data?) -> [String: Any]? {
        guard let data = data else { return nil }
        return try? jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
    
}

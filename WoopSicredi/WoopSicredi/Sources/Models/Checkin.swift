//
//  Checkin.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

public struct Checkin: Codable {
    let email: String
    let name: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case id = "eventId"
        case name
        case email
    }
    
}

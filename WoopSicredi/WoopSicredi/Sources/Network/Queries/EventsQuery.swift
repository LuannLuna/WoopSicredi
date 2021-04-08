//
//  EventsQuery.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

public enum EventsQuery: RestQuery {
    case all
    case event(id: Int)
    
    public var path: String {
        switch self {
        case .all:
            return "events"
        case .event(let id):
            return "events/\(id)"
        }
    }
    
    public var method: NetworkMethod { .get }
}

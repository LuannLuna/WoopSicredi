//
//  EventsQuery.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

public enum EventsQuery: RestQuery {
    case all
    case event(id: String)
    case checkin(checkin: Checkin)
    
    public var path: String {
        switch self {
        case .all:
            return "events"
        case .event(let id):
            return "events/\(id)"
        case .checkin:
            return "checkin"
        }
    }
    
    public var method: NetworkMethod {
        switch self {
        case .checkin: return .post
        default: return .get
        }
    }
    
    public var body: [String : Any]? {
        switch self {
        case .checkin(let checkin):
            let object = try? JSONDecoder().decode([String: String].self, from: JSONEncoder().encode(checkin))
            return object
        default: return nil
        }
    }
}

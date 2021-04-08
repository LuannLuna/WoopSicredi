//
//  Event.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

public struct Event: Decodable {
    let id: String
    let people: [Person]
    let date: Int
    let description: String
    let image: String
    let longitude: Double
    let latitude: Double
    let price: Double
    let title: String
    let cupons: [Cupon]?
}

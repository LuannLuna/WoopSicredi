//
//  Int+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

extension Int {
    func toDate() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
}

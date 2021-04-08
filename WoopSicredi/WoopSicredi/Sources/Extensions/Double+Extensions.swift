//
//  Double+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

extension Double {
    var formatted: String {
        "R$ \(String(format: "%.2f", self))"
    }
}

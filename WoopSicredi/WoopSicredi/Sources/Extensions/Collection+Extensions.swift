//
//  Collection+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

extension Collection {
    func element(at index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

//
//  ViewCodable.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import Foundation

protocol ViewCodable {
    func setup()
    func setupViews()
    func setupAnchors()
    func setupLayouts()
}

extension ViewCodable {

    func setup() {
        setupViews()
        setupAnchors()
        setupLayouts()
    }
    
    func setupLayouts() {}

}


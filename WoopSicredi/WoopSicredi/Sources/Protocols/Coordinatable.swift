//
//  Coordinatable.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import Foundation

protocol Coordinatable: class {
    func onFinish()
}

public protocol CoordinatorDelegate: class {
    func onCoordinatorFinish(_ coordinator: Coordinator?)
}

extension CoordinatorDelegate where Self: Coordinator {
    func onCoordinatorFinish(_ coordinator: Coordinator?) {
        guard let coordinator = coordinator else { return }
        removeChild(coordinator)
    }
}

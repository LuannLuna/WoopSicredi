//
//  ApplicationViewModel.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import Foundation

protocol ApplicationViewModelProtocol: class {
    func viewDidLoad()
}

class ApplicationViewModel: ApplicationViewModelProtocol {
    
    weak var view: ApplicationViewControllerProtocol?
    weak var coordinator: ApplicationCoordinatorProtocol?
    
    func viewDidLoad() {
        coordinator?.didSetupFinished()
    }
}


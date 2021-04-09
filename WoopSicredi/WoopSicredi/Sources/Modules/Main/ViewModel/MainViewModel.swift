//
//  MainViewModel.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import Foundation

protocol MainViewModelType: class {
    var view: MainViewControllerDelegate? { get set }
    var coordinator: MainViewCoordinatorDelegate? { get set }
}

class MainViewModel: MainViewModelType {
    
    public weak var view: MainViewControllerDelegate?
    public weak var coordinator: MainViewCoordinatorDelegate?
    
}

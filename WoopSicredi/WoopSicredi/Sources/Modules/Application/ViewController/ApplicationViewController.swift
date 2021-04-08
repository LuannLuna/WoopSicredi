//
//  ApplicationViewController.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import UIKit

protocol ApplicationViewControllerProtocol: class { }

class ApplicationViewController: UIViewController {

    var viewModel: ApplicationViewModelProtocol?

    public init(viewModel: ApplicationViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = ApplicationView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
    }
    
}

extension ApplicationViewController: ApplicationViewControllerProtocol { }

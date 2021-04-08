//
//  ApplicationView.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 07/04/21.
//

import UIKit
import SnapKit

public final class ApplicationView: UIView {
    
    private lazy var launchImageView = UIImageView().with {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "placeholder")
    }
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ApplicationView: ViewCodable {
    
    func setupViews() {
        addSubview(launchImageView)
    }
    
    func setupAnchors() {

        launchImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    func setupLayouts() {
        backgroundColor = .white
    }
}


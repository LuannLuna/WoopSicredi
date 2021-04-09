//
//  UITextField+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import UIKit

extension UITextField {
    func addBottomBorder(_ color: UIColor = .white){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.size.height + 10, width: frame.size.width, height: 0.5)
        bottomLine.backgroundColor = color.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}

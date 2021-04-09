//
//  UIView+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 09/04/21.
//

import UIKit

extension UIView {
    public func setBackgroundShadow(color: UIColor = .black, cornerRadius: CGFloat = 8.0, shadowRadius: CGFloat = 5.0, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = .zero
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
    }
}

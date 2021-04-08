//
//  Date+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import Foundation

extension Date {
    func formatted(dateStyle style: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .none) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        dateFormatter.timeStyle = timeStyle
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
}

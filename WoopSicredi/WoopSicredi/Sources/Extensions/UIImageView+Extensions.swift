//
//  UIImageView+Extensions.swift
//  WoopSicredi
//
//  Created by Luann Marques Luna on 08/04/21.
//

import UIKit

extension UIImageView {
    private func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                DispatchQueue.main.async() { [weak self] in
                    self?.image = #imageLiteral(resourceName: "placeholder")
                }
            }
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {
                DispatchQueue.main.async() { [weak self] in
                    self?.image = #imageLiteral(resourceName: "placeholder")
                }
                return
            }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

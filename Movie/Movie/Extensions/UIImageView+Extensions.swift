//
//  UIImage+Extensions.swift
//  Movie
//
//  Created by ITUMAC03 on 17/07/24.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    func downloadImage(from url: String?, placeholder: UIImage? = nil) {
        guard let url = url, let nsurl = URL(string: url) else {
            self.image = placeholder
            return
        }
        sd_setImage(with: nsurl, completed: nil)
    }
}

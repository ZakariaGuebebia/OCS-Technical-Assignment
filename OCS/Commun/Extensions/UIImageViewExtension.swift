//
//  UIImageViewExtension.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(withString: String, placeholderImage: UIImage?) {
        let url = URL(string: withString)
        self.sd_setImage(with: url, placeholderImage: placeholderImage)
    }
}

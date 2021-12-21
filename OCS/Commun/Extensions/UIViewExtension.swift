//
//  UIViewExtension.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import UIKit

extension UIView {

    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
    }
}

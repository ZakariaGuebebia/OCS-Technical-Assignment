//
//  UIcollectionViewExtension.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import UIKit

public extension UICollectionView {

    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
}

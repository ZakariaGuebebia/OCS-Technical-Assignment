//
//  UIViewControllerExtension.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import UIKit

extension UIViewController {

    class func instantiate<viewController: UIViewController>(appStoryboard: AppStoryboard) -> viewController {
        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! viewController
    }
}

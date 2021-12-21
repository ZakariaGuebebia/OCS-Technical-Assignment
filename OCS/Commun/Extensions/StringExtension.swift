//
//  StringExtension.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}

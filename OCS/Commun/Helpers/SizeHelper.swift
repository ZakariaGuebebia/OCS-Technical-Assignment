//
//  SizeHelper.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import UIKit

let defaultReferenceScreenWidth: CGFloat = (UIDevice().userInterfaceIdiom == .pad) ? 630 : 375.0

func getFormattedSize(_ size: CGFloat) -> CGFloat {
    let widthScreen: CGFloat =  UIScreen.main.bounds.size.width
    let result = CGFloat(size) * (widthScreen / defaultReferenceScreenWidth)
    return result
}

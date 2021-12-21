//
//  UILabelExtension.swift
//  OCS
//
//  Created by Zakaria on 12/12/2021.
//

import Foundation
import UIKit

extension UILabel {

    @objc  public func setAttributedText(text: String, lineSpace: CGFloat, characterSpacing: CGFloat = 0, font: String, size: Int, forgroundColor: UIColor?, align: NSTextAlignment = .left, shouldUseBaseLine: Bool = false, undeligned: Bool = false) {
        self.text = text

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = getFormattedSize(lineSpace)
        paragraphStyle.alignment = align
        paragraphStyle.lineBreakMode = .byTruncatingTail

        let font = (UIFont.init(name: font, size: getFormattedSize(CGFloat(size))))!

        let baseLine = shouldUseBaseLine ? -(font.ascender -  font.capHeight)/2 : 0

        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font, NSAttributedString.Key.kern:
                                                            getFormattedSize(characterSpacing),
                                                         NSAttributedString.Key.foregroundColor: (forgroundColor ?? self.textColor!),
                                                         NSAttributedString.Key.paragraphStyle: paragraphStyle ,
                                                         NSAttributedString.Key.baselineOffset: baseLine,
                                                         NSAttributedString.Key.underlineStyle: undeligned] as [NSAttributedString.Key: Any]

        let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
        self.attributedText = attributedText
//        self.adjustsFontSizeToFitWidth = true
        self.baselineAdjustment = .alignCenters
    }
}

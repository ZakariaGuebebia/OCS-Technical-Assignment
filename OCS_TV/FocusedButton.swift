//
//  FocusedButton.swift
//  OCS_TV
//
//  Created by Zakaria on 21/12/2021.
//

import UIKit

class FocusedButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private var focusAnimationDuration: Double = 0.5

    override var canBecomeFocused: Bool {
        return true
    }
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedItem === self {
            UIView.animate(withDuration: focusAnimationDuration, animations: {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
        }
        if context.previouslyFocusedItem === self {
            UIView.animate(withDuration: focusAnimationDuration, animations: {
                self.transform = CGAffineTransform.identity
            })
        }
    }
}

//
//  UIPaddedLabel.swift
//  UIKitCharacterApp
//
//  Created by Mohannad Bakbouk on 27/11/2024.
//

import Foundation
import UIKit

final class UIPaddedLabel: UILabel {
    
    // Padding values
    var padding: UIEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
    
    override func drawText(in rect: CGRect) {
        // Apply the padding by adjusting the drawing rectangle
        let paddedRect = rect.inset(by: padding)
        super.drawText(in: paddedRect)
    }
    
    // This is necessary to update the label's intrinsic content size when padding changes
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + padding.left + padding.right
        let height = size.height + padding.top + padding.bottom
        return CGSize(width: width, height: height)
    }
}

//
//  InsetsLabel.swift
//  Kitchen o'Clock
//
//  Created by Lucas van Dongen on 12/16/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

@IBDesignable class InsetsLabel: UILabel {

    @IBInspectable var labelInsetLeft: CGFloat = 5
    @IBInspectable var labelInsetRight: CGFloat = 5
    
    override func drawTextInRect(rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: labelInsetLeft, bottom: 0, right: labelInsetRight);
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }

}

//
//  SlideInfo.swift
//  Kitchen o'Clock
//
//  Created by Lucas van Dongen on 12/16/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

class SlideInfo: UIView {

    @IBOutlet var cookingInfo: UILabel?
    @IBOutlet var dragTip: UIImageView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // attach touch event to view
        // attach drag event to dragtip
    }

}

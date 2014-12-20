//
//  SlideInfo.swift
//  Kitchen o'Clock
//
//  Created by Lucas van Dongen on 12/16/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

class SlideInfo: UIView, UIGestureRecognizerDelegate {

    @IBOutlet var cookingInfo: UILabel?
    @IBOutlet var dragTip: UIImageView?
    @IBOutlet var tabSnapsToSide: NSLayoutConstraint?
    @IBOutlet var textSnapsToSide: NSLayoutConstraint?
    
    let highPriority: Float = 900
    let lowPriority: Float = 100
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // attach touch event to view
        // attach drag event to dragtip
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //
        if self.tabSnapsToSide == nil || self.textSnapsToSide == nil {
            return
        }
        
        let tabPriority = self.textSnapsToSide!.priority
        let textPriority = tabPriority == highPriority ? lowPriority : highPriority
        
        self.tabSnapsToSide!.priority = tabPriority
        self.textSnapsToSide!.priority = textPriority
        
        UIView.animateWithDuration(0.3, animations: {
            self.layoutIfNeeded()
            self.cookingInfo?.layoutIfNeeded()
            self.dragTip?.layoutIfNeeded()
        })
    }

}

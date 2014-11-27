//
//  RecipeCell.swift
//  Kitchen o'Clock
//
//  Created by Lucas on 26/11/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet var label: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureWithName(name: String, color: UIColor) {
        self.label?.text = name
        self.backgroundColor = color
    }
}

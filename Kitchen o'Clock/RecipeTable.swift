//
//  RecipeTable.swift
//  Kitchen o'Clock
//
//  Created by Lucas on 26/11/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

class RecipeTable: UITableView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = 44.0;
        self.tableFooterView = UIView(frame: CGRectZero);
    }

}

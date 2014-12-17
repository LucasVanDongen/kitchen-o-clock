//
//  Recipe.swift
//  Kitchen o'Clock
//
//  Created by Lucas on 26/11/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

public class Recipe: NSObject {
    var name: String
    var cookingInfo: String
    var secondsToPrepare: UInt
    var color: UIColor
    var imageName: String
    
    init(name: String, cookingInfo: String, secondsToPrepare: UInt, color: UIColor, imageName: String) {
        self.name = name
        self.cookingInfo = cookingInfo
        self.secondsToPrepare = secondsToPrepare
        self.color = color
        self.imageName = imageName
    }
}

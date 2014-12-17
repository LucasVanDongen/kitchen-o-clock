//
//  File.swift
//  Kitchen o'Clock
//
//  Created by Lucas van Dongen on 12/10/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import Foundation

@objc protocol RecipeSelectedProtocol: class {
    func recipeSelected(recipe: Recipe)
}
//
//  Recipes.swift
//  Kitchen o'Clock
//
//  Created by Lucas on 26/11/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

class Recipes: NSObject {
    var recipes: [Recipe] = []
    
    override init() {
        let artichokes: Recipe = Recipe(name: "Steamy Artichokes", cookingInfo: "Boiled, 25 minutes", secondsToPrepare: (UInt) (25 * 60), color: UIColor(red: 0.905, green: 0.741, blue: 0.501, alpha: 1), imageName: "artichocke")
        let broccoli: Recipe = Recipe(name: "Funky Broccoli", cookingInfo: "Boiled, 20 minutes", secondsToPrepare: (UInt) (20 * 60), color: UIColor(red: 0.376, green: 0.27, blue: 0.172, alpha: 1), imageName: "broccoli")
        let potato: Recipe = Recipe(name: "Sweet Potato", cookingInfo: "Oven 200 C | 392 F, 20 minutes", secondsToPrepare: (UInt) (20 * 60), color: UIColor(red: 0.368, green: 0.549, blue: 0.549, alpha: 1), imageName: "sweet_potato")
        let chicken: Recipe = Recipe(name: "Dancing Chicken", cookingInfo: "Oven 225 C | 437 F, 45 minutes", secondsToPrepare: (UInt) (45 * 60), color: UIColor(red: 0.325, green: 0.09, blue: 0.49, alpha: 1), imageName: "dancing_chicken")
        let eggs: Recipe = Recipe(name: "Jumping Eggs", cookingInfo: "Boiled, 12 minutes", secondsToPrepare: (UInt) (12 * 60), color: UIColor(red: 0.905, green: 0.705, blue: 0.745, alpha: 1), imageName: "jumping_eggs")
        let brownie: Recipe = Recipe(name: "Rocky Brownie", cookingInfo: "Oven 160 C | 329 F, 25 minutes", secondsToPrepare: (UInt) (25 * 60), color: UIColor(red: 0.835, green: 0.525, blue: 0.223, alpha: 1), imageName: "rocky_brownie")
        let cookies: Recipe = Recipe(name: "Smiley Cookies", cookingInfo: "Oven 177 C | 350 F , 10 minutes", secondsToPrepare: (UInt) (10 * 60), color: UIColor(red: 0.576, green: 0.725, blue: 0.717, alpha: 1), imageName: "smiley_cookies")

        self.recipes.append(artichokes)
        self.recipes.append(broccoli)
        self.recipes.append(potato)
        self.recipes.append(chicken)
        self.recipes.append(eggs)
        self.recipes.append(brownie)
        self.recipes.append(cookies)
    }
}

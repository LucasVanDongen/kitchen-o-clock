//
//  MealController.swift
//  Kitchen o'Clock
//
//  Created by Lucas van Dongen on 12/10/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

class MealController: UIViewController {
    
    var recipe: Recipe?

    @IBOutlet var background: UIView?
    @IBOutlet var image: UIImageView?

    override func viewDidLoad() {
        super.viewDidLoad()

        if (self.recipe != nil) {
            return
        }
        
        let setRecipe: Recipe = recipe!
        self.view.backgroundColor = setRecipe.color
        let recipeImage: UIImage? = UIImage(named: setRecipe.imageName)
        self.image?.image = recipeImage
    }

}

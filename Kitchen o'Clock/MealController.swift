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

    @IBOutlet var image: UIImageView?
    @IBOutlet var slideInfo: SlideInfo?
    @IBOutlet var timer: TimerLabel?
    @IBOutlet var startButton: UIButton?
    @IBOutlet var pauseButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pauseButton?.enabled = false
        if (self.recipe == nil) {
            self.startButton?.enabled = false
            return
        }
        
        let setRecipe: Recipe = recipe!
        self.setImage(setRecipe.imageName)
        self.view.backgroundColor = setRecipe.color
        self.slideInfo?.cookingInfo!.text = setRecipe.cookingInfo
    }
    
    func setImage(imageName: String) {
        if (self.image == nil) {
            return
        }
        
        let recipeImage: UIImage? = UIImage(named: imageName)
        if (recipeImage == nil) {
            return
        }

        self.image?.image = recipeImage
    }
    
    @IBAction func startTapped(sender: UIButton) {
        self.startButton?.enabled = false
        self.pauseButton?.enabled = true
    }
    
    @IBAction func pauseTapped(sender: UIButton) {
        self.startButton?.enabled = true
        self.pauseButton?.enabled = false
    }
}

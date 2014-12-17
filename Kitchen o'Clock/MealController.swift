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
    @IBOutlet var imageRatio: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()

        if (self.recipe == nil) {
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
        
        let imageWidth: CGFloat = recipeImage!.size.width
        let imageHeight: CGFloat = recipeImage!.size.height
        if (imageRatio != nil) {
            self.view.removeConstraint(imageRatio!)
        }
        
        let multiplier: CGFloat = self.image!.frame.height / self.image!.frame.width
        
        self.imageRatio = NSLayoutConstraint(item: self.image!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.image!, attribute: NSLayoutAttribute.Width, multiplier: multiplier, constant: 0)
        
        self.view.addConstraint(self.imageRatio!)
    }

}

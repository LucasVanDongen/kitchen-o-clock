//
//  RecipesController.swift
//  Kitchen o'Clock
//
//  Created by Lucas van Dongen on 12/10/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

public class RecipesController: UIViewController, RecipeSelectedProtocol {
    
    var selectedRecipe: Recipe?
    
    public func recipeSelected(recipe: Recipe) {
        self.selectedRecipe = recipe;
        self.performSegueWithIdentifier("toMeal", sender: nil)
    }
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier != "toMeal") {
            return;
        }
        
        if (self.selectedRecipe == nil) {
            return;
        }
        
        let menuController: MealController = segue.destinationViewController as MealController
        menuController.recipe = self.selectedRecipe
    }
}

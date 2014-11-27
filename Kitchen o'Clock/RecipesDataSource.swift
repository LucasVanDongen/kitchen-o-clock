//
//  RecipesDataSource.swift
//  Kitchen o'Clock
//
//  Created by Lucas on 26/11/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

class RecipesDataSource: NSObject, UITableViewDataSource {
    let recipes: Recipes = Recipes()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.recipes.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: RecipeCell = tableView.dequeueReusableCellWithIdentifier("Recipe Cell", forIndexPath: indexPath) as RecipeCell
        
        let recipe: Recipe = self.recipes.recipes[indexPath.row]
        cell.configureWithName(recipe.name, color: recipe.color)
        
        return cell
    }
}

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
    @IBOutlet var timeLeft: TimerLabel?
    @IBOutlet var startButton: UIButton?
    @IBOutlet var pauseButton: UIButton?
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pauseButton?.enabled = false
        if (self.recipe == nil) {
            self.startButton?.enabled = false
            return
        }
        
        self.setUpTimer(self.recipe!.secondsToPrepare)
        
        let setRecipe: Recipe = recipe!
        self.setImage(setRecipe.imageName)
        self.timeLeft?.setTime(self.recipe!.secondsToPrepare)
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
    
    func setUpTimer(initialTime: UInt) {
        self.timer = Timer()
        self.timer?.timeLeft = Int32(initialTime)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"timerUpdate", name:"timerUpdate", object: self.timer)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"timerFinish", name:"timerFinish", object: self.timer)
    }
    
    func timerUpdate() {
        let timeLeft = UInt(self.timer!.timeLeft)
        self.timeLeft?.setTime(timeLeft)
    }
    
    func timerFinished() {
        
    }
    
    @IBAction func startTapped(sender: UIButton) {
        self.startButton?.enabled = false
        self.pauseButton?.enabled = true
        self.timer?.start()
    }
    
    @IBAction func pauseTapped(sender: UIButton) {
        self.startButton?.enabled = true
        self.pauseButton?.enabled = false
        self.timer?.pause()
    }
}

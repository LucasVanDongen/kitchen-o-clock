//
//  TimerLabel.swift
//  Kitchen o'Clock
//
//  Created by Lucas van Dongen on 12/23/14.
//  Copyright (c) 2014 Departamento B. All rights reserved.
//

import UIKit

class TimerLabel: UILabel {

    func setTime(seconds: UInt) {
        let timeString = self.timeFromSeconds(seconds)
        self.text = timeString
    }
    
    func timeFromSeconds(seconds: UInt) -> String {
        let minutes = seconds / 60;
        let seconds = seconds % 60;
        
        let secondsString = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let timeString = "\(minutes):\(secondsString)"
        
        return timeString
    }

}

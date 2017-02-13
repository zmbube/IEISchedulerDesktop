//
//  Teacher.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 2/9/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class Teacher: NSObject {
    
    var name:String
    var availableTimes=[String:Bool]()
    var currentHappiness:Double
    
    init(name:String){
        currentHappiness=0;
        self.name=name
    }
}

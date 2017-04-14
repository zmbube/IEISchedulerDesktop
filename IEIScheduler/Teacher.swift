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
    var id:String
    var timePrefs = NSDictionary()
    var availableTimes:[String:Bool]=["8am":true,"9am":true,"10am":true,"11am":true,"12pm":true,"1pm":true,"2pm":true,"3pm":true,"4pm":true]
    var classPreferences = NSMutableDictionary()
    var comments = ""
    var currentHappiness:Double
    var classesAssigned=0
    
    init(name:String,id:String){
        currentHappiness=0;
        self.name=name
        self.id=id
    }
}

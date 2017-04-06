//
//  Class.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 2/9/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class Class: NSObject {
    var teacher:Teacher?
    var time:String?
    var room:Room?
    var classTitle:String?
    var sectNum:Int?
    
    
    init(classTitle:String,sectNum:Int){
        self.classTitle=classTitle
        self.sectNum=sectNum
        
    }
}

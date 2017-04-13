//
//  Room.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 2/9/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class Room: NSObject {

    var availableTimes=[String:Bool]()
    var buildingID:String
    
    init(id:String, times:[String:Bool]){
        buildingID=id
        availableTimes=times
    }
}

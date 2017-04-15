//
//  AdminTabViewController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/4/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class AdminTabViewController: NSTabViewController {
    
    var teachers:[Teacher]=[]
    var classSections:[String:[Int:[Class]]]=[:]
    var rooms:[Room]=[]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    override func viewWillAppear(){
        classSections=((self.parent as? AdminController)?.classSections)!
    }
    
}

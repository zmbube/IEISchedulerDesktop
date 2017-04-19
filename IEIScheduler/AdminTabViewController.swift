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
        self.view.wantsLayer=true
        
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColor = CGColor(red: 1, green: 0.75, blue: 0.54, alpha: 1.0)
            self.view.layer?.backgroundColor = color
        }
    }

    override func viewWillAppear(){
        classSections=((self.parent as? AdminController)?.classSections)!
    }
    
}

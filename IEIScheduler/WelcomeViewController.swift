//
//  WelcomeViewController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/2/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class WelcomeViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func setSections(_ sender: NSButton) {
        
    }
    @IBAction func finishedSections(_ sender: NSButton) {
         (self.parent as? NSTabViewController)?.selectedTabViewItemIndex=1
    }
}

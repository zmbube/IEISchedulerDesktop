//
//  WelcomeViewController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/2/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class WelcomeViewController: NSViewController {
    
    @IBOutlet weak var fundamentalTextField: NSTextField!
    @IBOutlet weak var lvl1TextField: NSTextField!
    @IBOutlet weak var lvl2TextField: NSTextField!
    @IBOutlet weak var lvl3TextField: NSTextField!
    @IBOutlet weak var lvl4TextField: NSTextField!
    @IBOutlet weak var lvl5UndergradTextField: NSTextField!
    @IBOutlet weak var lvl5GradTextField: NSTextField!
    
    @IBAction func lvl6UndergradPopUpButton(_ sender: AnyObject) {
    }
    @IBAction func lvl6GradPopUpButton(_ sender: AnyObject) {
    }
    @IBAction func gradOrUndergradRadioButton(_ sender: AnyObject) {
    }
    @IBAction func sectionRadioButton(_ sender: AnyObject) {
    }
    @IBAction func selectSkill(_ sender: AnyObject) {
    }
    
    
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

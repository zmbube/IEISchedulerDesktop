//
//  WelcomeViewController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/2/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class WelcomeViewController: NSViewController {
    
    @IBOutlet weak var fundamentalPopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl1PopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl2PopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl3PopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl4PopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl5UndergradPopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl5GradPopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl6UndergradPopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl6GradPopUpButton: NSPopUpButton!

    var selectedSkills:[Int32:Bool]=[1:true,2:true,3:true,4:true,5:true,6:true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func gradOrUndergradRadioButton(_ sender: AnyObject) {
    }
    @IBAction func sectionRadioButton(_ sender: AnyObject) {
    }
    @IBAction func selectSkill(_ sender: NSButton) {
        let skill = Int32(sender.title)
        selectedSkills[skill!] = !selectedSkills[skill!]!
    }

    @IBAction func setSections(_ sender: NSButton) {
        
    }
    @IBAction func finishedSections(_ sender: NSButton) {
        
        
         (self.parent as? NSTabViewController)?.selectedTabViewItemIndex=1
    }
}

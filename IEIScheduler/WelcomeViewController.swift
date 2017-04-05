//
//  WelcomeViewController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/2/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class WelcomeViewController: NSViewController {
    
    //PopUpButtonOutlets
    @IBOutlet weak var fundamentalPopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl1PopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl2PopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl3PopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl4PopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl5UndergradPopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl5GradPopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl6UndergradPopUpButton: NSPopUpButton!
    @IBOutlet weak var lvl6GradPopUpButton: NSPopUpButton!
    //Section Radio Button Outlets
    @IBOutlet weak var sect1RadioButton: NSButton!
    @IBOutlet weak var sect2RadioButton: NSButton!
    @IBOutlet weak var sect3RadioButton: NSButton!
    @IBOutlet weak var sect4RadioButton: NSButton!
    @IBOutlet weak var sect5RadioButton: NSButton!
    //Grad/Undergrad Radio Button Outlets
    @IBOutlet weak var gradRadioButton: NSButton!
    @IBOutlet weak var underGradRadioButton: NSButton!
    //Dictionary binding skill number to whether or not it is selected. toggled on checkbox click
    var selectedSkills:[Int32:Bool]=[1:true,2:true,3:true,4:true,5:true,6:true]
    //Dictionaries for each level binding section number to an array of the classes in the section
    var fundamentalSections:[Int:[Class]]=[:]
    var level1Sections:[Int:[Class]]=[:]
    var level2Sections:[Int:[Class]]=[:]
    var level3Sections:[Int:[Class]]=[:]
    var level4Sections:[Int:[Class]]=[:]
    var level5Sections:[Int:[Class]]=[:]
    var level6USections:[Int:[Class]]=[:]
    var level6GSections:[Int:[Class]]=[:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
    }
    
    @IBAction func gradOrUndergradRadioButton(_ sender: NSButton) {
        var sect=""
        if(sender.title=="UnderGraduate"){
            sect=(lvl6UndergradPopUpButton.selectedItem?.title)!
            
            
        }else{
            sect=(lvl6GradPopUpButton.selectedItem?.title)!
        }
        setEnabledSectButtons(sect: sect)
    }
    @IBAction func sectionRadioButton(_ sender: NSButton) {
    }
    @IBAction func selectSkill(_ sender: NSButton) {
        let skill = Int32(sender.title)
        selectedSkills[skill!] = !selectedSkills[skill!]!
    }

    @IBAction func setSections(_ sender: NSButton) {
        if(underGradRadioButton.state==NSOnState || gradRadioButton.state==NSOnState){
            if(sectionIsSelected()){
                
            }
            
        }
    }
    @IBAction func finishedSections(_ sender: NSButton) {
        
        
         (self.parent as? NSTabViewController)?.selectedTabViewItemIndex=1
    }
    @IBAction func selectedChanged(_ sender: NSPopUpButton) {
        sect1RadioButton.state=1
        sect2RadioButton.state=0
        sect3RadioButton.state=0
        sect4RadioButton.state=0
        sect5RadioButton.state=0
    }
    
    func setEnabledSectButtons(sect: String){
        sect2RadioButton.isEnabled=true
        sect3RadioButton.isEnabled=true
        sect4RadioButton.isEnabled=true
        sect5RadioButton.isEnabled=true

        if(sect<="1"){
            sect2RadioButton.isEnabled=false
        }
        if(sect<="2"){
            sect3RadioButton.isEnabled=false
        }
        if(sect<="3"){
            sect4RadioButton.isEnabled=false
            
        }
        if(sect<="4"){
            sect5RadioButton.isEnabled=false
            
        }
    }
    
    func sectionIsSelected()->Bool{
        if(sect1RadioButton.state==NSOnState || sect2RadioButton.state==NSOnState || sect3RadioButton.state==NSOnState || sect4RadioButton.state==NSOnState || sect5RadioButton.state==NSOnState ){
            return true
        }
        return false
    }
}

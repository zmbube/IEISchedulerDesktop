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
    var selectedSkills:[Int:Bool]=[1:true,2:true,3:true,4:true,5:true,6:true]
    //Dictionaries for each level binding section number to an array of the classes in the section
    var fundamentalSections:[Int:[Class]]=[:]
    var level1Sections:[Int:[Class]]=[:]
    var level2Sections:[Int:[Class]]=[:]
    var level3Sections:[Int:[Class]]=[:]
    var level4Sections:[Int:[Class]]=[:]
    var level5USections:[Int:[Class]]=[:]
    var level5GSections:[Int:[Class]]=[:]
    var level6USections:[Int:[Class]]=[:]
    var level6GSections:[Int:[Class]]=[:]
    
    var standing = ""
    var section = 1
    
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
    
    @IBAction func gradOrUndergradRadioButton(_ sender: NSButton) {
        var sect=""
        
        if(sender.title=="UnderGraduate"){
            sect=(lvl6UndergradPopUpButton.selectedItem?.title)!
            standing=""
            
        }else{
            sect=(lvl6GradPopUpButton.selectedItem?.title)!
            standing="G"
        }
        setEnabledSectButtons(sect: sect)
    }
    @IBAction func sectionRadioButton(_ sender: NSButton) {
        section=Int(sender.title)!
    }
    @IBAction func selectSkill(_ sender: NSButton) {
        let skill = Int(sender.title)
        selectedSkills[skill!] = !selectedSkills[skill!]!
    }

    
    @IBAction func setSections(_ sender: NSButton) {
        if(underGradRadioButton.state==NSOnState || gradRadioButton.state==NSOnState){
            if(sectionIsSelected()){
                var classes:[Class]=[]
                for i in 1 ... 6{
                    let boolean = selectedSkills[i]
                    if(boolean)!{
                        let title="16\(i)\(standing)"
                        classes.append(Class(classTitle: title,sectNum: section))
                    }
                }
                if(standing=="G"){
                    level6GSections[section]=classes
                }else{
                    level6USections[section]=classes
                }
            }
        }
        //TODO: Show count of currently set sections
    }
    
    @IBAction func finishedSections(_ sender: NSButton) {
        if(Int((lvl6GradPopUpButton.selectedItem?.title)!) != level6GSections.count || Int((lvl6UndergradPopUpButton.selectedItem?.title)!) != level6USections.count){
            return
        }
        let lvlf=Int((fundamentalPopUpButton.selectedItem?.title)!)!
        let lvl1=Int((lvl1PopUpButton.selectedItem?.title)!)!
        let lvl2=Int((lvl2PopUpButton.selectedItem?.title)!)!
        let lvl3=Int((lvl3PopUpButton.selectedItem?.title)!)!
        let lvl4=Int((lvl4PopUpButton.selectedItem?.title)!)!
        let lvl5u=Int((lvl5UndergradPopUpButton.selectedItem?.title)!)!
        let lvl5g=Int((lvl5GradPopUpButton.selectedItem?.title)!)!
        for i in 1 ... 5{
            if(lvlf>=i){
                fundamentalSections[i]=[Class(classTitle:"101",sectNum:i),Class(classTitle:"102",sectNum:i),Class(classTitle:"103",sectNum:i),Class(classTitle:"104",sectNum:i),Class(classTitle:"105",sectNum:i),Class(classTitle:"106",sectNum:i)]
            }
            if(lvl1>=i){
                level1Sections[i]=[Class(classTitle:"111",sectNum:i),Class(classTitle:"112",sectNum:i),Class(classTitle:"113",sectNum:i),Class(classTitle:"114",sectNum:i),Class(classTitle:"115",sectNum:i),Class(classTitle:"116",sectNum:i)]
            }
            if(lvl2>=i){
                level2Sections[i]=[Class(classTitle:"121",sectNum:i),Class(classTitle:"122",sectNum:i),Class(classTitle:"123",sectNum:i),Class(classTitle:"124",sectNum:i),Class(classTitle:"125",sectNum:i),Class(classTitle:"126",sectNum:i)]

            }
            if(lvl3>=i){
                level3Sections[i]=[Class(classTitle:"131",sectNum:i),Class(classTitle:"132",sectNum:i),Class(classTitle:"133",sectNum:i),Class(classTitle:"134",sectNum:i),Class(classTitle:"135",sectNum:i),Class(classTitle:"136",sectNum:i)]

            }
            if(lvl4>=i){
                level4Sections[i]=[Class(classTitle:"141",sectNum:i),Class(classTitle:"142",sectNum:i),Class(classTitle:"143",sectNum:i),Class(classTitle:"144",sectNum:i),Class(classTitle:"145",sectNum:i),Class(classTitle:"146",sectNum:i)]

            }
            if(lvl5u>=i){
                level5USections[i]=[Class(classTitle:"151",sectNum:i),Class(classTitle:"152",sectNum:i),Class(classTitle:"153",sectNum:i),Class(classTitle:"154",sectNum:i),Class(classTitle:"155",sectNum:i),Class(classTitle:"156",sectNum:i)]

            }
            if(lvl5g>=i){
                level5GSections[i]=[Class(classTitle:"151G",sectNum:i),Class(classTitle:"152G",sectNum:i),Class(classTitle:"153G",sectNum:i),Class(classTitle:"154G",sectNum:i),Class(classTitle:"155G",sectNum:i),Class(classTitle:"156G",sectNum:i)]

            }
        }
        let classSections=["F":fundamentalSections,"1":level1Sections,"2":level2Sections,"3":level3Sections,"4":level4Sections,"5u":level5USections,"5g":level5GSections,"6u":level6USections,"6g":level6GSections]
        ((self.parent as? NSTabViewController)?.tabViewItems[1].viewController as? AdminController)?.classSections=classSections
         (self.parent as? NSTabViewController)?.selectedTabViewItemIndex=1
    }
    
    
    @IBAction func selectedChanged(_ sender: NSPopUpButton) {
        sect1RadioButton.state=0
        sect2RadioButton.state=0
        sect3RadioButton.state=0
        sect4RadioButton.state=0
        sect5RadioButton.state=0
        underGradRadioButton.state=0
        gradRadioButton.state=0
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

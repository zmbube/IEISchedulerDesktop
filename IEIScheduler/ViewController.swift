//
//  ViewController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 2/9/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var teachers:[Teacher]=[]
    @IBOutlet weak var optionsTableContainer: NSView!
    var optionsTableView:ClassOptionsTable?
    var adminTab:AdminTabViewController?
    var selectedLevel="F"
    var classSections:[String:[Int:[Class]]]=[:]
    var rooms:[Room]=[]
    
    @IBOutlet weak var classTable: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        adminTab=(self.parent as? AdminTabViewController)
        classTable.delegate=self
        classTable.dataSource=self

    }
    
    override func viewWillAppear() {
        self.classSections=(adminTab?.classSections)!
        optionsTableView?.classSections=classSections
        classTable.reloadData()
        optionsTableView?.containerToMaster=self
            }
    
    override func viewDidAppear() {
        self.rooms=(adminTab?.rooms)!
        optionsTableView?.rooms=self.rooms
        self.teachers=(adminTab?.teachers)!
        optionsTableView?.teachers=teachers

    }
    
    func reloadTable(){
        classTable.reloadData()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func selectedLevelChanged(_ sender: NSPopUpButton) {
        selectedLevel=sender.titleOfSelectedItem!
        classTable.reloadData()
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOptionsTableSegue" {
            optionsTableView = segue.destinationController as? ClassOptionsTable
        }
        if segue.identifier=="scheduleDisplay"{
            (segue.destinationController as? ScheduleDisplayController)?.classes=self.classSections
        }
    }

}

extension ViewController: NSTableViewDelegate{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier="ClassCell"
        var text1=""
        var text2=""
        var text3=""
        var text4=""
        var text2Color=NSColor.black
        
        if(tableColumn == classTable.tableColumns[0] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 0){
            text1=(classSections[selectedLevel]?[row+1]?[0].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[0].teacher?.name ?? "NA"
            text3=classSections[selectedLevel]?[row+1]?[0].time ?? "NA"
            text4=classSections[selectedLevel]?[row+1]?[0].room?.buildingID ?? "NA"
            if(text2 != "NA"){
                text2Color=textColor(teacher: (classSections[selectedLevel]?[row+1]?[0].teacher)! , className: text1)
            }
            
        }
        else if(tableColumn!==classTable.tableColumns[1] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 1){
            text1=(classSections[selectedLevel]?[row+1]?[1].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[1].teacher?.name ?? "NA"
            text3=classSections[selectedLevel]?[row+1]?[1].time ?? "NA"
            text4=classSections[selectedLevel]?[row+1]?[1].room?.buildingID ?? "NA"
            if(text2 != "NA"){
                text2Color=textColor(teacher: (classSections[selectedLevel]?[row+1]?[1].teacher)! , className: text1)
            }
        }
        else if(tableColumn!==classTable.tableColumns[2] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 2){
            text1=(classSections[selectedLevel]?[row+1]?[2].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[2].teacher?.name ?? "NA"
            text3=classSections[selectedLevel]?[row+1]?[2].time ?? "NA"
            text4=classSections[selectedLevel]?[row+1]?[2].room?.buildingID ?? "NA"
            if(text2 != "NA"){
                text2Color=textColor(teacher: (classSections[selectedLevel]?[row+1]?[2].teacher)! , className: text1)
            }
        }
        else if(tableColumn!==classTable.tableColumns[3] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 3){
            text1=(classSections[selectedLevel]?[row+1]?[3].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[3].teacher?.name ?? "NA"
            text3=classSections[selectedLevel]?[row+1]?[3].time ?? "NA"
            text4=classSections[selectedLevel]?[row+1]?[3].room?.buildingID ?? "NA"
            if(text2 != "NA"){
                text2Color=textColor(teacher: (classSections[selectedLevel]?[row+1]?[3].teacher)! , className: text1)
            }
        }
        else if(tableColumn!==classTable.tableColumns[4] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 4){
            text1=(classSections[selectedLevel]?[row+1]?[4].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[4].teacher?.name ?? "NA"
            text3=classSections[selectedLevel]?[row+1]?[4].time ?? "NA"
            text4=classSections[selectedLevel]?[row+1]?[4].room?.buildingID ?? "NA"
            if(text2 != "NA"){
                text2Color=textColor(teacher: (classSections[selectedLevel]?[row+1]?[4].teacher)! , className: text1)
            }
        }
        else if(tableColumn!==classTable.tableColumns[5] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 5){
            text1=(classSections[selectedLevel]?[row+1]?[5].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[5].teacher?.name ?? "NA"
            text3=classSections[selectedLevel]?[row+1]?[5].time ?? "NA"
            text4=classSections[selectedLevel]?[row+1]?[5].room?.buildingID ?? "NA"
            if(text2 != "NA"){
                text2Color=textColor(teacher: (classSections[selectedLevel]?[row+1]?[5].teacher)! , className: text1)
            }
        }
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? TeacherTableCell {
            cell.textField?.stringValue = text1
            cell.textField2?.stringValue = text2
            cell.textField2?.textColor=text2Color
            cell.textField3?.stringValue="Time: \(text3)"
            cell.textField4?.stringValue="Room: \(text4)"
            return cell
        }
        
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        optionsTableView?.display="section"
        optionsTableView?.selectedLevel=selectedLevel
        optionsTableView?.reloadForSection(section: classTable.selectedRow+1)
    }
    
    func textColor(teacher:Teacher, className:String)->NSColor{
        if((teacher.classPreferences[className] as? String) == "1"){
            return NSColor.green
        }
        else if((teacher.classPreferences[className] as? String) == "2"){
            return NSColor(calibratedRed: 1.0, green: 0.84, blue: 0.0, alpha: 1.0)
        }
        else if((teacher.classPreferences[className] as? String) == "3"){
            return NSColor.black
        }
        else if((teacher.classPreferences[className] as? String) == "4"){
            return NSColor.red
        }
        
        
        return NSColor.black
    }
    
}
extension ViewController: NSTableViewDataSource{
    func numberOfRows(in tableView: NSTableView) -> Int {
        if (!classSections.isEmpty){
        return (classSections[selectedLevel]?.count)!
        }
        return 0
    }
}


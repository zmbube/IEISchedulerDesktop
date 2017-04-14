//
//  ClassOptionsTable.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/2/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class ClassOptionsTable: NSViewController {

    @IBOutlet weak var classOptionsTable: NSTableView!
    var containerToMaster: ViewController?
    var teachers:[Teacher]=[]
    var classSections:[String:[Int:[Class]]]=[:]
    let times=["8am","9am","10am","11am","12pm","1pm","2pm","3pm","4pm"]
    var display=""
    var selectedSection=0
    var selectedLevel=""
    var selectedClass:Class?
    var selectedTeacher:Teacher?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        classOptionsTable.delegate=self
        classOptionsTable.dataSource=self
    }
    
    override func viewWillAppear() {

    }
    
    func reloadForSection(section:Int){
        //teachers.sort{($0.classPreferences[className] as! String) < ($1.classPreferences[className] as! String)}
        selectedSection=section
        classOptionsTable.reloadData()
    }
}

extension  ClassOptionsTable: NSTableViewDataSource{
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        if display=="teacher"{
        return teachers.count
        }
        else if(display=="section"){
            return (classSections[selectedLevel]![selectedSection]?.count)!
        }
        else if(display=="time"){
            return times.count
        }
        return 0
    }
}

extension ClassOptionsTable: NSTableViewDelegate{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = "TeacherCell"
        
        
        if let cell = classOptionsTable.make(withIdentifier: cellIdentifier, owner: nil) as? TeacherTableCell {
            if display=="teacher"{
            
            cell.textField?.stringValue = teachers[row].name
            cell.textField2.stringValue="# of Classes: \(teachers[row].classesAssigned)"
            
            }
            if display=="section"{
             cell.textField?.stringValue=(classSections[selectedLevel]?[selectedSection]?[row].classTitle)!
                cell.textField2.stringValue=(classSections[selectedLevel]?[selectedSection]?[row].teacher?.name) ?? "NA"
            }
            if display=="time"{
                if !(selectedTeacher?.availableTimes[times[row]])! {
                    return nil
                }
                cell.textField?.stringValue=times[row]
                cell.textField2.stringValue=""
            }
            return cell
        }
        
        
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if(display=="section"){
            display="teacher"
            selectedClass=classSections[selectedLevel]?[selectedSection]?[classOptionsTable.selectedRow]
            teachers.sort{($0.classPreferences[selectedClass!.classTitle!] as? String)! < ($1.classPreferences[selectedClass!.classTitle!] as? String)!}
            classOptionsTable.reloadData()
        }
        else if(display=="teacher"){
            display="time"
            selectedTeacher=teachers[classOptionsTable.selectedRow]
            classOptionsTable.reloadData()
        }
        else if(display=="time"){
            selectedClass?.time=times[classOptionsTable.selectedRow]
            selectedClass?.teacher=selectedTeacher
            selectedTeacher?.availableTimes[times[classOptionsTable.selectedRow]]=false
            display="section"
            classOptionsTable.reloadData()
            containerToMaster?.reloadTable()
        }
    }
}

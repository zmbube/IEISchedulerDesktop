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
    var display=""
    var selectedSection=0
    var selectedLevel=""
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
            return cell
        }
        
        
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if(display=="section"){
            display="teacher"
            let className=classSections[selectedLevel]?[selectedSection]?[classOptionsTable.selectedRow].classTitle
            teachers.sort{($0.classPreferences[className! as String] as? String)! < ($1.classPreferences[className! as String] as? String)!}
            classOptionsTable.reloadData()
        }
    }
}

//
//  PreferenceOverrideController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/3/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class PreferenceOverrideController: NSViewController {
    @IBOutlet weak var teacherTable: NSTableView!
    @IBOutlet weak var classTable: NSTableView!
    let classes = ["101", "102", "103", "104", "105", "106", "111", "112", "113", "114", "115", "116", "121", "122", "123", "124", "125", "126", "131", "132", "133", "134", "135", "136", "141", "142", "143", "144", "145", "146", "151", "152", "153", "154", "155", "156", "151G", "152G", "153G", "154G", "155G", "156G"]
    var adminTab:AdminTabViewController?
    var teachers:[Teacher]=[]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        classTable.delegate=self
        classTable.dataSource=self
        teacherTable.delegate=self
        teacherTable.dataSource=self
        adminTab=(self.parent as? AdminTabViewController)
    }
    
    override func viewWillAppear() {
        teachers=(adminTab?.teachers)!
        teacherTable.reloadData()
        classTable.reloadData()
    }

    
    @IBAction func teach(_ sender: NSButton) {
        adminTab?.teachers[teacherTable.selectedRow].classPreferences[classes[classTable.selectedRow]]="0"
        

    }
    @IBAction func dontTeach(_ sender: NSButton) {
        adminTab?.teachers[teacherTable.selectedRow].classPreferences[classes[classTable.selectedRow]]="5"
    }

}
extension  PreferenceOverrideController: NSTableViewDataSource{
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        if(tableView==classTable){
            return classes.count
        }
        else if(tableView==teacherTable){
            return (teachers.count)
        }
     return 0
    }
}

extension PreferenceOverrideController: NSTableViewDelegate{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = "classCell"
        
        if tableView == self.classTable{
            if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
                cell.textField?.stringValue = self.classes[row]
                return cell
            }
        }
        //cell identifier is currently set to classCell, might need changeed later on to the teacherCell
        if tableView == self.teacherTable{
            if let cell = tableView.make(withIdentifier: "teacherCell", owner: nil) as? NSTableCellView {
                cell.textField?.stringValue = (adminTab?.teachers[row].name)!
                return cell
            }
        }
        return nil
    }}

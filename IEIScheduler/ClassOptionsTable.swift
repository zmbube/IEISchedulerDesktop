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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        classOptionsTable.delegate=self
        classOptionsTable.dataSource=self
    }
    
}

extension  ClassOptionsTable: NSTableViewDataSource{
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return teachers.count
    }
}

extension ClassOptionsTable: NSTableViewDelegate{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = "TeacherCell"
        
        
        if let cell = classOptionsTable.make(withIdentifier: cellIdentifier, owner: nil) as? TeacherTableCell {
            cell.textField?.stringValue = teachers[row].name
            cell.textField2.stringValue=teachers[row].id
            return cell
        }
        
        
        return nil
    }
}

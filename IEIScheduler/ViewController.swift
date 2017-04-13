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
    
    @IBOutlet weak var classTable: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        adminTab=(self.parent as? AdminTabViewController)
        classTable.delegate=self
        classTable.dataSource=self

    }
    
    override func viewWillAppear() {
        classTable.reloadData()
        self.teachers=(adminTab?.teachers)!
        optionsTableView?.teachers=teachers
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
    }

}

extension ViewController: NSTableViewDelegate{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier="ClassCell"
        var text1=""
        var text2=""
        
        if tableColumn == tableView.tableColumns[0] {
            text1=(adminTab?.classSections[selectedLevel]?[1]?[row].classTitle)!
            text2=(adminTab?.classSections[selectedLevel]?[1]?[row].classTitle)!
        }
        else if( tableColumn==tableView.tableColumns[1]){
            if((adminTab?.classSections[selectedLevel]?.count)!>1){
            text1=(adminTab?.classSections[selectedLevel]?[2]?[row].classTitle)!
            text2=(adminTab?.classSections[selectedLevel]?[2]?[row].classTitle)!
            }
            else{return nil}
        }
        else if( tableColumn==tableView.tableColumns[2]){
            if((adminTab?.classSections[selectedLevel]?.count)!>2){
                text1=(adminTab?.classSections[selectedLevel]?[3]?[row].classTitle)!
                text2=(adminTab?.classSections[selectedLevel]?[3]?[row].classTitle)!
            }
            else{return nil}
        }
        else if( tableColumn==tableView.tableColumns[3]){
            if((adminTab?.classSections[selectedLevel]?.count)!>3){
                text1=(adminTab?.classSections[selectedLevel]?[4]?[row].classTitle)!
                text2=(adminTab?.classSections[selectedLevel]?[4]?[row].classTitle)!
            }
            else{return nil}
        }
        else if( tableColumn==tableView.tableColumns[4]){
            if((adminTab?.classSections[selectedLevel]?.count)!>4){
                text1=(adminTab?.classSections[selectedLevel]?[5]?[row].classTitle)!
                text2=(adminTab?.classSections[selectedLevel]?[5]?[row].classTitle)!
            }
            else{return nil}

        }
        
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? TeacherTableCell {
            cell.textField?.stringValue = text1
            cell.textField2?.stringValue = text2
            return cell
        }
        
        return nil
    }
    
}
extension ViewController: NSTableViewDataSource{
    func numberOfRows(in tableView: NSTableView) -> Int {
        return 6
    }
}


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
        var text2:String?
        
        if tableColumn == tableView.tableColumns[0] {
            if(((adminTab?.classSections[selectedLevel]?[1])?.endIndex)! > row){
            text1=(adminTab?.classSections[selectedLevel]?[1]?[row].classTitle)!
            text2=adminTab?.classSections[selectedLevel]?[1]?[row].teacher?.name ?? "NA"
            }
            else {return nil}
        }
        else if( tableColumn==tableView.tableColumns[1]){
            if((adminTab?.classSections[selectedLevel]?.count)!>1){
                if(((adminTab?.classSections[selectedLevel]?[2])?.endIndex)! > row){
            text1=(adminTab?.classSections[selectedLevel]?[2]?[row].classTitle)!
            text2=adminTab?.classSections[selectedLevel]?[2]?[row].teacher?.name ?? "NA"
                }
                else {return nil}
            }
            else{return nil}
        }
        else if( tableColumn==tableView.tableColumns[2]){
            if((adminTab?.classSections[selectedLevel]?.count)!>2){
                if(((adminTab?.classSections[selectedLevel]?[3])?.endIndex)! > row){
                text1=(adminTab?.classSections[selectedLevel]?[3]?[row].classTitle)!
                text2=adminTab?.classSections[selectedLevel]?[3]?[row].teacher?.name ?? "NA"
                }
                else {return nil}
            }
            else{return nil}
        }
        else if( tableColumn==tableView.tableColumns[3]){
            if((adminTab?.classSections[selectedLevel]?.count)!>3){
                if(((adminTab?.classSections[selectedLevel]?[4])?.endIndex)! > row){
                text1=(adminTab?.classSections[selectedLevel]?[4]?[row].classTitle)!
                text2=adminTab?.classSections[selectedLevel]?[4]?[row].teacher?.name ?? "NA"
                }
                else {return nil}
            }
            else{return nil}
        }
        else if( tableColumn==tableView.tableColumns[4]){
            if((adminTab?.classSections[selectedLevel]?.count)!>4){
                if(((adminTab?.classSections[selectedLevel]?[5])?.endIndex)! > row){
                text1=(adminTab?.classSections[selectedLevel]?[5]?[row].classTitle)!
                text2=adminTab?.classSections[selectedLevel]?[5]?[row].teacher?.name ?? "NA"
                }
            }
            else{return nil}

        }
        
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? TeacherTableCell {
            cell.textField?.stringValue = text1
            cell.textField2?.stringValue = text2 ?? "NA"
            return cell
        }
        
        return nil
    }
    
}
extension ViewController: NSTableViewDataSource{
    func numberOfRows(in tableView: NSTableView) -> Int {
        if(adminTab?.classSections.count==0){
            return 0
        }
        return 6
    }
}


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
    }

}

extension ViewController: NSTableViewDelegate{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier="ClassCell"
        var text1=""
        var text2:String?
        
        if(tableColumn == classTable.tableColumns[0]){
            text1=(classSections[selectedLevel]?[row+1]?[0].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[0].teacher?.name ?? "NA"
        }
        else if(tableColumn!==classTable.tableColumns[1] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 1){
            text1=(classSections[selectedLevel]?[row+1]?[1].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[1].teacher?.name ?? "NA"
        }
        else if(tableColumn!==classTable.tableColumns[2] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 2){
            text1=(classSections[selectedLevel]?[row+1]?[2].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[2].teacher?.name ?? "NA"
        }
        else if(tableColumn!==classTable.tableColumns[3] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 3){
            text1=(classSections[selectedLevel]?[row+1]?[3].classTitle)!
            text2=classSections[selectedLevel]?[row]?[3].teacher?.name ?? "NA"
        }
        else if(tableColumn!==classTable.tableColumns[4] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 4){
            text1=(classSections[selectedLevel]?[row+1]?[4].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[4].teacher?.name ?? "NA"
        }
        else if(tableColumn!==classTable.tableColumns[5] && (classSections[selectedLevel]?[row+1]?.endIndex)! > 5){
            text1=(classSections[selectedLevel]?[row+1]?[5].classTitle)!
            text2=classSections[selectedLevel]?[row+1]?[5].teacher?.name ?? "NA"
        }
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? TeacherTableCell {
            cell.textField?.stringValue = text1
            cell.textField2?.stringValue = text2 ?? "NA"
            return cell
        }
        
        return nil
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        optionsTableView?.display="section"
        optionsTableView?.selectedLevel=selectedLevel
        optionsTableView?.reloadForSection(section: classTable.selectedRow+1)
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


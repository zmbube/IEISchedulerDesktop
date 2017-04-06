//
//  RoomController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/3/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class RoomController: NSViewController {
    @IBOutlet var buildingEnter: NSView!
    @IBOutlet weak var roomNumberEnter: NSTextField!
    @IBOutlet weak var roomSelect: NSTableView!
    let rooms = ["rooms go here", "and here", "etc"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        roomSelect.delegate=self
        roomSelect.dataSource=self
    }
    @IBAction func timeSelect(_ sender: NSButton) {
    }
    @IBAction func dateSelect(_ sender: NSButton) {
    }
    @IBAction func addRoom(_ sender: NSButton) {
    }
    @IBAction func removeRoom(_ sender: NSButton) {
    }
    
}
extension  RoomController: NSTableViewDataSource{
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return rooms.count
    }
}

extension RoomController: NSTableViewDelegate{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellIdentifier = "roomCell"
        
        if tableView == self.roomSelect{
            if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
                cell.textField?.stringValue = self.rooms[row]
                return cell
            }
        }
        return nil
    }}

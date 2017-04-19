//
//  RoomController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/3/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class RoomController: NSViewController {
    @IBOutlet weak var buildingEnter: NSTextField!
    @IBOutlet weak var roomNumberEnter: NSTextField!
    @IBOutlet weak var roomSelect: NSTableView!
    var roomIDs = ["AB 014", "AB 015", "CA 110", "ILS", "LA 011S", "LA 012S", "LA 013S", "LA 017S", "LA 018S", "LA 019S", "LA 020S", "RB 351", "RB 352", "RB 354", "RB 360"]
//I think LA is lafollette, RB is robert bell, unsure on the others, will have to ask phil to find out
    var selectedTimes:[String:Bool]=["8am":true,"9am":true,"10am":true,"11am":true,"12pm":true,"1pm":true,"2pm":true,"3pm":true,"4pm":true]
    var selectedDates:[String:Bool]=["M":true,"T":true,"W":true,"R":true,"F":true]
    var rooms:[Room]=[]
    var adminTab:AdminTabViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        adminTab=self.parent as? AdminTabViewController
        roomSelect.delegate=self
        roomSelect.dataSource=self
        for ID in roomIDs{
            rooms.append(Room(id: ID, times:selectedTimes))
        }
        roomSelect.reloadData()
        self.view.wantsLayer=true
        
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColor = CGColor(red: 1, green: 0.75, blue: 0.54, alpha: 1.0)
            self.view.layer?.backgroundColor = color
        }
    }

    
    
    override func viewWillDisappear() {
        adminTab?.rooms=rooms
    }
    
    @IBAction func timeSelect(_ sender: NSButton) {
        let time = String(sender.title)
        selectedTimes[time!] = !selectedTimes[time!]!
    }
    @IBAction func dateSelect(_ sender: NSButton) {
        let date = String(sender.title)
        selectedDates[date!] = !selectedDates[date!]!
    }
    @IBAction func addRoom(_ sender: NSButton) {
        let room = Room(id:"\(buildingEnter.stringValue) \(roomNumberEnter.stringValue)", times:selectedTimes)
        rooms.append(room)
        roomSelect.reloadData()
    }
    @IBAction func removeRoom(_ sender: NSButton) {
        rooms.remove(at: roomSelect.selectedRow)
        roomSelect.reloadData()
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
        
        if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = self.rooms[row].buildingID
            return cell
        }
        
            return nil
    }}

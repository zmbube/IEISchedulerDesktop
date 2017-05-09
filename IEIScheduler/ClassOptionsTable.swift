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
    var rooms:[Room]=[]
    let times=["8am","9am","10am","11am","12pm","1pm","2pm","3pm","4pm"]
    var display=""
    var selectedSection=0
    var selectedLevel=""
    var selectedClass:Class?
    var selectedTeacher:Teacher?
    var selectedTime=""
    var availableTimes:[String]=[]
    var availableRooms:[Room]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        classOptionsTable.delegate=self
        classOptionsTable.dataSource=self
        self.view.wantsLayer=true
        
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColor = CGColor(red: 1, green: 0.75, blue: 0.54, alpha: 1.0)
            self.view.layer?.backgroundColor = color
        }
    }

    
    override func viewWillAppear() {

    }
    
    func reloadForSection(section:Int){
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
            return availableTimes.count
        }
        else if(display=="room"){
            return availableRooms.count
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
                cell.textField?.textColor=NSColor.black
                
                    cell.textField?.textColor = textColor(teacher: teachers[row] , className: (selectedClass?.classTitle)!)
                
            
            }
            else if display=="section"{
             cell.textField?.stringValue=(classSections[selectedLevel]?[selectedSection]?[row].classTitle)!
                cell.textField2.stringValue=(classSections[selectedLevel]?[selectedSection]?[row].teacher?.name) ?? "NA"
                cell.textField?.textColor=NSColor.black
            }
            else if display=="time"{

                cell.textField?.stringValue=availableTimes[row]
                cell.textField2.stringValue=""
                if(selectedTeacher?.timePrefs[availableTimes[row]] as? String == "1"){
                    cell.textField?.textColor=NSColor.green                }
            }
            else if display=="room"{
                cell.textField?.textColor=NSColor.black
                cell.textField?.stringValue=availableRooms[row].buildingID
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
            if(selectedClass?.teacher != nil){
                selectedClass?.teacher?.availableTimes[(selectedClass?.time)!]=true
                selectedClass?.room?.availableTimes[(selectedClass?.time)!]=true
                selectedClass?.time=nil
            }
            teachers.sort{($0.classPreferences[selectedClass!.classTitle] as? String)! < ($1.classPreferences[selectedClass!.classTitle] as? String)!}
            classOptionsTable.reloadData()
        }
            
        else if(display=="teacher"){
            availableTimes=[]
            display="time"
            selectedTeacher=teachers[classOptionsTable.selectedRow]
            for time in times{
                if(selectedTeacher?.availableTimes[time])!{
                    availableTimes.append(time)
                }
                for skillClass in (classSections[selectedLevel]?[selectedSection])!{
                    if(skillClass.time != nil && availableTimes.contains(skillClass.time!)){
                        availableTimes.remove(at: availableTimes.index(of: skillClass.time!)!)
                    }
                }
            }
            classOptionsTable.reloadData()
        }
            
        else if(display=="time"){
            selectedTime=availableTimes[classOptionsTable.selectedRow]
            availableRooms=[]
            display="room"
            for room in rooms{
                if(room.availableTimes[selectedTime])!{
                    availableRooms.append(room)
                }
            }
            classOptionsTable.reloadData()
        }
            
        else if(display=="room"){
            display=""
            selectedClass?.time=selectedTime
            selectedClass?.teacher=selectedTeacher
            selectedTeacher?.availableTimes[selectedTime]=false
            selectedTeacher?.classesAssigned += 1
            rooms[classOptionsTable.selectedRow].availableTimes[selectedTime]=false
            selectedClass?.room=rooms[classOptionsTable.selectedRow]
            classOptionsTable.reloadData()
            containerToMaster?.reloadTable()
            

        }
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

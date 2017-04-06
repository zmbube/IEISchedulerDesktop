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
    let teacherInfoUrl="https://www.zmbube.com/API/selectTeacher.php"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        
        
    }

    
    @IBAction func teach(_ sender: NSButton) {
        //override the class preference and set it to 0
        var teachers=[Teacher]()
        let teachersInfo=parseUrl(urlInput: teacherInfoUrl)
        for teacher in teachersInfo {
            let temp = Teacher(name: "\(teacher["F_Name"] as! String) \(teacher["L_Name"] as! String)" ,id:teacher["U_ID"] as! String)
            teachers.append(temp)
        }
        let classPrefs=parseUrl(urlInput: classPrefUrl)
        
        for prefs in classPrefs {
            for teacher in teachers {
                if(teacher.id==(prefs["U_ID"] as! String)){
                    teacher.classPreferences = 0
                }
            }

        }
    @IBAction func dontTeach(_ sender: NSButton) {
        //override the class preference and set it to 5var teachers=[Teacher]()
        let teachersInfo=parseUrl(urlInput: teacherInfoUrl)
        for teacher in teachersInfo {
            let temp = Teacher(name: "\(teacher["F_Name"] as! String) \(teacher["L_Name"] as! String)" ,id:teacher["U_ID"] as! String)
            teachers.append(temp)
        }
        let classPrefs=parseUrl(urlInput: classPrefUrl)
        
        for prefs in classPrefs {
            for teacher in teachers {
                if(teacher.id==(prefs["U_ID"] as! String)){
                    teacher.classPreferences = 5
                }
            }

        }
}

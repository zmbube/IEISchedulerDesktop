//
//  AdminController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/3/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class AdminController: NSViewController {
    var scheduler=Schedule()
    let parser=SurveyResultsParser()
    var teachers:[Teacher]=[]
    var classSections:[String]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        teachers=parser.getTeachers()
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let adminTabs=segue.destinationController as? AdminTabViewController
        adminTabs?.teachers=self.teachers
    }
    
}

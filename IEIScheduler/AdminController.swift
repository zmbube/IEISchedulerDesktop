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
    var classSections:[String:[Int:[Class]]]=[:]
    var adminTabs:AdminTabViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        teachers=parser.getTeachers()
        adminTabs?.teachers=self.teachers
    }
    
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        let tabs=segue.destinationController as? AdminTabViewController
        self.adminTabs=tabs
    }
    
}

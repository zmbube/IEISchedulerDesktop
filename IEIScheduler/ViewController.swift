//
//  ViewController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 2/9/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var scheduler=Schedule()
    let parser=SurveyResultsParser()
    var teachers:[Teacher]=[]
    @IBOutlet weak var optionsTableContainer: NSView!
    var optionsTableView:ClassOptionsTable?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teachers = parser.getTeachers()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOptionsTableSegue" {
            optionsTableView = segue.destinationController as? ClassOptionsTable
            optionsTableView!.teachers = self.teachers
        }
    }

}


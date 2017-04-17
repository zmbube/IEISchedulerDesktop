//
//  ScheduleDisplayController.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 4/16/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class ScheduleDisplayController: NSViewController {

    var classes:[String:[Int:[Class]]]=[:]
    @IBOutlet weak var text: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let attrStr = try! NSAttributedString(
            data: "<h1 align=\"center\"><b><i>text</i></b></h1>".data(using: String.Encoding.unicode, allowLossyConversion: true)!,
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
            documentAttributes: nil)
        text.attributedStringValue=attrStr
        let test="test write to file"
        do{try test.write(toFile: "/Users/Zachary/Desktop/text.txt", atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error {
            print("something went wrong: \(error)")
        }
    }
    
    
}

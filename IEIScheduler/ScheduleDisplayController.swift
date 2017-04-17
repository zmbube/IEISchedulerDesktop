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
    @IBOutlet weak var text: NSTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        let attrStr = try! NSAttributedString(
            data: "<h1 align=\"center\"><b><i>text</i></b></h1><br><br><br><br><br>hello".data(using: String.Encoding.unicode, allowLossyConversion: true)!,
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
            documentAttributes: nil)
        text.textStorage?.setAttributedString(attrStr)
        let test="test write to file"
        do{try test.write(toFile: "/Users/Zachary/Desktop/text.txt", atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error {
            print("something went wrong: \(error)")
        }
        do{
        let htmlData = try attrStr.data(from: NSMakeRange(0, attrStr.length), documentAttributes: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType])
        
            if let htmlString = NSString(data: htmlData, encoding: String.Encoding.utf8.rawValue) {
                print(htmlString)
                
            }
        }
        catch {
            return
        }
        
        }
    
        
    }
    
    


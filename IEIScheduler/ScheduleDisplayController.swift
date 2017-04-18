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
    let levels=["F","1","2","3","4","5u","5g","6u","6g"]
    @IBOutlet weak var text: NSTextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let str=formatSchedule()
        let attrStr = try! NSAttributedString(
            data: str.data(using: String.Encoding.unicode, allowLossyConversion: true)!,
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
            documentAttributes: nil)
        text.textStorage?.setAttributedString(attrStr)
//        let test="test write to file"
//        do{try test.write(toFile: "/Users/Zachary/Desktop/text.txt", atomically: false, encoding: String.Encoding.utf8)
//        }
//        catch let error {
//            print("something went wrong: \(error)")
//        }
//        do{
//        let htmlData = try attrStr.data(from: NSMakeRange(0, attrStr.length), documentAttributes: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType])
//        
//            if let htmlString = NSString(data: htmlData, encoding: String.Encoding.utf8.rawValue) {
//                print(htmlString)
//                
//            }
//        }
//        catch {
//            return
//        }
        
        }
    
    func formatSchedule()->String{
        var result="<h1 align=\"center\">S# 20##</h1>\n"
        
        for level in levels{
            let count=classes[level]?.count
            for i in 1 ... count!{
                result+="<h1 align=\"center\"><<\(i)>></h1>\n<h3>IEI<<\(i)>></h3>\n<h3>CRN<<#>></h3>\n\n<table>"
                for item in (classes[level]?[i])!{
                    result+="<tr>\(item.toHTMLString())</tr>"
                }
                result+="</table>"
            }
        }
        return result
    }
    
    @IBAction func saveSchedule(_ sender: NSButton) {
        let attrStr=text.attributedString()
        do{
            let htmlData = try attrStr.data(from: NSMakeRange(0, attrStr.length), documentAttributes: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType])
            
            if let htmlString = NSString(data: htmlData, encoding: String.Encoding.utf8.rawValue) {
                let output=(htmlString as String)+"<style> body {width:8.5in;height:11in}</style>\n"
                do{try output.write(toFile: "/Users/Zachary/Desktop/text.html", atomically: false, encoding: String.Encoding.utf8)
                }
                catch let error {
                    print("something went wrong: \(error)")
                }
            }
        }
        catch {
            return
        }
        
        
    }
}




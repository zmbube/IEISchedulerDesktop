//
//  Class.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 2/9/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class Class: NSObject {
    var teacher:Teacher?
    var time:String?
    var room:Room?
    var classTitle:String
    var sectNum:Int
    var standing:String
    
    
    init(classTitle:String,sectNum:Int,standing:String){
        self.classTitle=classTitle
        self.sectNum=sectNum
        self.standing=standing
    }
    
    func toHTMLString()-> String{
        var result=""
        result+="<td>IEI<br>"
        if time != nil && time! < "12"{
            result+="MTRF"
        }else if time != nil {
            result+="MTWR"
        }
        result+="</td><td>\(classTitle) - "
        if(classTitle.hasSuffix("1") || classTitle.hasSuffix("1G")){
            result+="Writing"
        }
        else if(classTitle.hasSuffix("2") || classTitle.hasSuffix("2G")){
            result+="Grammar"
        }
        else if classTitle.hasSuffix("3") || classTitle.hasSuffix("3G"){
            result+="Reading"
        }
        else if classTitle.hasSuffix("4") || classTitle.hasSuffix("4G"){
            result+="Oral Communication"
        }
        else if classTitle.hasSuffix("5") || classTitle.hasSuffix("5G"){
            result+="Extensive Reading & Keyboarding"
        }
        else if classTitle.hasSuffix("6") || classTitle.hasSuffix("6G"){
            result+="Vocabulary & Literacy"
        }
        result+="</td><td>Instructor: "
        if teacher != nil{
            result+=(teacher?.name)!
        }
        result+="<br>"
        if time != nil {
            if time!.contains("am"){
                result+=time!.replacingOccurrences(of: "am", with: ":00 AM - ") + time!.replacingOccurrences(of: "am", with: ":50 AM")
            }
            else{
                result+=time!.replacingOccurrences(of: "pm", with: ":00 PM") + time!.replacingOccurrences(of: "pm", with: ":50 PM")
            }
            
        }
        if room != nil{
        result+="</td><td><br>\(room!.buildingID)</td>"
        }else{
            result+="</td><td></td>"
        }
        
        return result
    }
}

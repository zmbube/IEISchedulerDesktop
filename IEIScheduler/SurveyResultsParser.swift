//
//  SurveyResultsParser.swift
//  IEIScheduler
//
//  Created by Zachary Bube on 3/21/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class SurveyResultsParser: NSObject {
    
    let teacherInfoUrl="https://www.zmbube.com/API/selectTeacher.php"
    let classPrefUrl="https://www.zmbube.com/API/selectclassPref.php"
    let timePrefUrl="https://www.zmbube.com/API/selectTimePref.php"
    let commentsUrl="https://www.zmbube.com/API/selectComment.php"
    let adminInfoUrl="https://www.zmbube.com/API/selectAdminInfo.php"
    let adminOverrideUrl="https://www.zmbube.com/API/selectAdminOverride.php"
    
    func getTeachers()->[Teacher]{
        var teachers=[Teacher]()
        let teachersInfo=parseUrl(urlInput: teacherInfoUrl)
        for teacher in teachersInfo {
            let temp = Teacher(name: "\(teacher["F_Name"] as! String) \(teacher["L_Name"] as! String)" ,id:teacher["U_ID"] as! String)
            teachers.append(temp)
        }
        let classPrefs=parseUrl(urlInput: classPrefUrl)
        let timePrefs=parseUrl(urlInput: timePrefUrl)
        let comments=parseUrl(urlInput: commentsUrl)
        
        for prefs in classPrefs {
            for teacher in teachers {
                if(teacher.id==(prefs["U_ID"] as! String)){
                    teacher.classPreferences = prefs as! NSMutableDictionary
                }
            }
        }
        
        for prefs in timePrefs {
            for teacher in teachers {
                if(teacher.id==(prefs["U_ID"] as! String)){
                    teacher.timePrefs=prefs
                }
            }
        }
        
        for prefs in comments {
            for teacher in teachers {
                if(teacher.id==(prefs["U_ID"] as! String)){
                    teacher.comments=prefs["Comment"] as! String
                }
            }
        }
        
        return teachers
    }
    
    
    func getAdmins(){
        
    }
    
    func getTeacherList()->[Teacher]{
        var teachers=[Teacher]()
        let teachersInfo=parseUrl(urlInput: teacherInfoUrl)
        for teacher in teachersInfo {
            let temp = Teacher(name: "\(teacher["F_Name"] as! String) \(teacher["L_Name"] as! String)" ,id:teacher["U_ID"] as! String)
            teachers.append(temp)
        }
        return teachers
    }
    
    func parseUrl(urlInput:String)->[NSDictionary]{
        var dataLoaded=false
        var results:[NSDictionary]=[]
        let urlAsString=urlInput
        let url=URL(string: urlAsString)
        let urlSession=URLSession.shared
        let task = urlSession.dataTask(with: url!,completionHandler: {data, response, error -> Void in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray{
                    
                    for item in jsonResult{
                        results.append(item as! NSMutableDictionary)
                    }
                }
                dataLoaded=true
            }
            catch{}
        })
        task.resume()
        while(!dataLoaded){
            sleep(2)
        }
        return results
    }

}


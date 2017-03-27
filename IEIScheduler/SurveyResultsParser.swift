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
    var dataLoadedCount=0
    var results:[NSDictionary]=[]
    
    func parseUrl(urlInput:String){
        let urlAsString=urlInput
        let url=URL(string: urlAsString)
        let urlSession=URLSession.shared
        let task = urlSession.dataTask(with: url!,completionHandler: {data, response, error -> Void in
            do{
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSArray{
                    
                    for item in jsonResult{
                        self.results.append(item as! NSDictionary)
                    }
                }
                self.dataLoadedCount += 1
            }
            catch{}
        })
        task.resume()
        while(dataLoadedCount != 6){
            sleep(2)
        }

    }

}


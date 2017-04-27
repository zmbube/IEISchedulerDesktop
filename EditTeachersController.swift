//
//  editTeachersController.swift
//  IEIScheduler
//
//  Created by dtgoelz on 4/6/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class EditTeachersController: NSViewController {
    
    @IBOutlet weak var editTeacherTable: NSTableView!
    @IBOutlet weak var label: NSTextField!
    
    var teachers:[Teacher]=[]
    var response=""
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer=true
        editTeacherTable.dataSource=self
        editTeacherTable.delegate=self
        let parser=SurveyResultsParser()
        teachers=parser.getTeacherList()
        editTeacherTable.reloadData()
        }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColor = CGColor(red: 1, green: 0.75, blue: 0.54, alpha: 1.0)
            self.view.layer?.backgroundColor = color
        }
    }

   
    @IBAction func deleteTeacherEditButton(_ sender: AnyObject) {
        let index=editTeacherTable.selectedRow
        let id=teachers[index].id
        teachers.remove(at:index)
        editTeacherTable.reloadData()
        delete(id: id)
    }
    
    func delete(id:String){
        let url=URL(string:"https://zmbube.com/API/DeleteTeacher.php")
        
        var request:URLRequest=URLRequest(url:url!)
        let bodyData="UID=\(id)"
        
        request.httpMethod="POST"
        request.httpBody=bodyData.data(using: String.Encoding.utf8);
        
        
        let task=URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data=data, error==nil else{
            print("error=\(error)")
            return
            }
            
            if let httpStatus=response as? HTTPURLResponse,httpStatus.statusCode != 200{
                print("conection error")
                }
            self.response=String(data:data,encoding: .utf8)!
            
        }
        
        task.resume()
    }
}




    extension  EditTeachersController: NSTableViewDataSource{
        
        func numberOfRows(in tableView: NSTableView) -> Int {
            return teachers.count
        }
    }
    
    extension EditTeachersController: NSTableViewDelegate{
        
        func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
            let cellIdentifier = "cell"
            
            
            //cell identifier is currently set to classCell, might need changeed later on to the teacherCell
          
                if let cell = tableView.make(withIdentifier: cellIdentifier, owner: nil) as? NSTableCellView {
                    cell.textField?.stringValue = (teachers[row].name)
                    return cell
                }
            
            return nil
        }}



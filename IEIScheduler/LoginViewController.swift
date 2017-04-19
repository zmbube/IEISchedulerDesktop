//
//  LoginViewController.swift
//  IEIScheduler
//
//  Created by dtgoelz on 4/6/17.
//  Copyright © 2017 CSCapstoneSection2. All rights reserved.
//

import Cocoa

class LoginViewController: NSViewController {

    
    @IBOutlet weak var userNameTextBox: NSTextField!
    @IBOutlet weak var passwordTextBox: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.view.wantsLayer=true
        
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            let color : CGColor = CGColor(red: 1, green: 0.75, blue: 0.54, alpha: 1.0)
            self.view.layer?.backgroundColor = color
        }
    }

    @IBAction func loginButtton(_ sender: AnyObject) {
    }
    
}

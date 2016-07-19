//
//  AddAlarmTitleViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/6/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AddAlarmTitleViewController: UIViewController {

    @IBOutlet weak var addAlarmTextEdit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "background.png")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
    }
    
    // Dismiss the keyboard when the user taps the "Return" key or its equivalent
    // while editing a text field.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        Common.sharedInstance.setCurAlarmTitle(textField.text!)

        self.navigationController?.popViewControllerAnimated(true);
        
        return true;
    }
    
    @IBAction func backBtnClick(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}

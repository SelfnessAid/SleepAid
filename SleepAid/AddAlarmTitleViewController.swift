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
    }
    
    // Dismiss the keyboard when the user taps the "Return" key or its equivalent
    // while editing a text field.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        Common.sharedInstance.setCurAlarmTitle(textField.text!)

        _ = self.navigationController?.popViewController(animated: true);
        
        return true;
    }
    
    @IBAction func backBtnClick(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}

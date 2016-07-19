//
//  AnswerViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/12/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.yesBtn.layer.cornerRadius = 5.0
        self.yesBtn.layer.borderWidth = 2.0
        self.yesBtn.layer.borderColor = UIColor(hue: 0.067, saturation: 0.97, brightness: 0.79, alpha: 1.0).CGColor
        
        self.noBtn.layer.cornerRadius = 5.0
        self.noBtn.layer.borderWidth = 2.0
        self.noBtn.layer.borderColor = UIColor(hue: 0.067, saturation: 0.97, brightness: 0.79, alpha: 1.0).CGColor
        let backgroundImage = UIImage(named: "background.png")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    @IBAction func BtnClicked(sender: AnyObject) {
        if sender as! NSObject == self.yesBtn {
            
        } else {
            
        }
    }
}

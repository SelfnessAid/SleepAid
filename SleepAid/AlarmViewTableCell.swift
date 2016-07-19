//
//  AlarmViewTableCell.swift
//  SleepAid
//
//  Created by MobileStar on 6/5/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AlarmViewTableCell: UITableViewCell {

    @IBOutlet weak var alarmDescription: UILabel!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var alarmTitle: UILabel!
    @IBOutlet weak var alarmToggle: UISwitch!
    @IBOutlet weak var alarmIsAM: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        alarmTime.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
        alarmDescription.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
        alarmTitle.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
        alarmIsAM.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
        alarmToggle.onTintColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
        alarmToggle.tintColor = UIColor.clearColor()
        alarmToggle.backgroundColor = UIColor.init(red: 23.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)
        alarmToggle.layer.cornerRadius = 16.0
        self.backgroundColor = UIColor.init(red: 19.0/255.0, green: 21.0/255.0, blue: 51.0/255.0, alpha: 1.0)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func stateChanged(switchState: UISwitch) {
        if switchState.on {
            alarmTitle.hidden = false
            alarmTime.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
            alarmDescription.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
            alarmTitle.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
            alarmIsAM.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
            alarmToggle.onTintColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
        } else {
            alarmTitle.hidden = true
            alarmTime.textColor = UIColor.init(red: 23.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)
            alarmDescription.textColor = UIColor.init(red: 23.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)
            alarmTitle.textColor = UIColor.init(red: 23.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)
            alarmIsAM.textColor = UIColor.init(red: 23.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)
            alarmToggle.tintColor = UIColor.clearColor()
        }
    }
    
    
}

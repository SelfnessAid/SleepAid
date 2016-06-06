//
//  AlarmViewTableCell.swift
//  SleepAid
//
//  Created by MobileStar on 6/5/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AlarmViewTableCell: UITableViewCell {

    @IBOutlet weak var alarmToggle: UISwitch!
    @IBOutlet weak var alarmDescription: UILabel!
    @IBOutlet weak var alarmisAM: UILabel!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var alarmTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        alarmTime.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 1.0)
        alarmDescription.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 1.0)
        alarmisAM.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 1.0)
        alarmTitle.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 1.0)
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func stateChanged(switchState: UISwitch) {
        if switchState.on {
            alarmTitle.hidden = false
            alarmTime.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 1.0)
            alarmDescription.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 1.0)
            alarmisAM.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 1.0)
            alarmTitle.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 1.0)
        } else {
            alarmTitle.hidden = true
            alarmTime.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 0.6)
            alarmDescription.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 0.6)
            alarmisAM.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 0.6)
            alarmTitle.textColor = UIColor(hue: 0.5861, saturation: 0.71, brightness: 0.93, alpha: 0.6)
        }
    }
}

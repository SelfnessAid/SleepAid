//
//  NotifyViewTableCell.swift
//  SleepAid
//
//  Created by MobileStar on 6/10/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class NotifyViewTableCell: UITableViewCell {
    
    @IBOutlet weak var alarmToggle: UISwitch!
    @IBOutlet weak var alarmTitle: UILabel!
    @IBOutlet weak var alarmIsAM: UILabel!
    @IBOutlet weak var alarmDescription: UILabel!
    @IBOutlet weak var alarmTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        alarmToggle.tintColor = UIColor.clear

        alarmToggle.layer.cornerRadius = 16.0

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func stateChanged(_ switchState: UISwitch) {
        if switchState.isOn {
            alarmTitle.isHidden = false
            alarmDescription.isHidden = false
        } else {
            alarmTitle.isHidden = true
            alarmDescription.isEnabled = true

        }
    }
}

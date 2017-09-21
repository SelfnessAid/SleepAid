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
        
        alarmToggle.layer.cornerRadius = 16.0
        alarmToggle.tintColor = UIColor.clear
    }
    
    func setActiveUI(state: Bool) {
        if (state) {
            alarmTime.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
            alarmDescription.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
            alarmTitle.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
            alarmIsAM.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        } else {
            alarmTime.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
            alarmDescription.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
            alarmTitle.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
            alarmIsAM.textColor = UIColor.init(red: 0.0, green: 99.0/255.0, blue: 1.0, alpha: 1.0)
        }
        
        //
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
            alarmDescription.isHidden = true
        }
    }
    
    
}

//
//  AddAlarmViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/5/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit
import Foundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class AddAlarmViewController: UITableViewController {
    
    @IBOutlet weak var alarmMusicLabel: UILabel!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var alarmTitleLabel: UILabel!
    @IBOutlet weak var MonLabel: UILabel!
    @IBOutlet weak var TueLabel: UILabel!
    @IBOutlet weak var WedLabel: UILabel!
    @IBOutlet weak var ThuLabel: UILabel!
    @IBOutlet weak var FriLabel: UILabel!
    @IBOutlet weak var SatLabel: UILabel!
    @IBOutlet weak var SunLabel: UILabel!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    @IBOutlet weak var borderLabel: UILabel!
    var selectDays = [NSInteger](repeating: 0, count: 7)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let Montap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.MonlabelAction(_:)))
        Montap.numberOfTapsRequired = 1
        

        let Tuetap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.TuelabelAction(_:)))
        Tuetap.numberOfTapsRequired = 1
        
        let Wedtap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.WedlabelAction(_:)))
        Wedtap.numberOfTapsRequired = 1
        
        let Thutap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.ThulabelAction(_:)))
        Thutap.numberOfTapsRequired = 1
        
        let Fritap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.FrilabelAction(_:)))
        Fritap.numberOfTapsRequired = 1
        
        let Sattap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.SatlabelAction(_:)))
        Sattap.numberOfTapsRequired = 1
        
        let Suntap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.SunlabelAction(_:)))
        Suntap.numberOfTapsRequired = 1
        
        
        
        MonLabel.addGestureRecognizer(Montap)
        TueLabel.addGestureRecognizer(Tuetap)
        WedLabel.addGestureRecognizer(Wedtap)
        ThuLabel.addGestureRecognizer(Thutap)
        FriLabel.addGestureRecognizer(Fritap)
        SatLabel.addGestureRecognizer(Sattap)
        SunLabel.addGestureRecognizer(Suntap)
        
        MonLabel.isUserInteractionEnabled = true
        TueLabel.isUserInteractionEnabled = true
        WedLabel.isUserInteractionEnabled = true
        ThuLabel.isUserInteractionEnabled = true
        FriLabel.isUserInteractionEnabled = true
        SatLabel.isUserInteractionEnabled = true
        SunLabel.isUserInteractionEnabled = true
        
        MonLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        TueLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        WedLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        ThuLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        FriLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        SatLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        SunLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        
        self.doneBtn.isEnabled = false
        
        self.dataPicker.datePickerMode = UIDatePickerMode.time
        self.dataPicker.timeZone = TimeZone.autoupdatingCurrent
        self.dataPicker.locale = Locale.current
        self.dataPicker.calendar = Calendar.current
        self.dataPicker.setValue(UIColor.white, forKeyPath: "textColor")
        
        
        self.borderLabel.layer.cornerRadius = 5.0
        self.borderLabel.layer.borderColor = UIColor.init(red: 252.0/255.0, green: 207.0/255.0, blue: 87.0/255.0, alpha: 1.0).cgColor
        self.borderLabel.layer.borderWidth = 2.0

    }
    
    func MonlabelAction(_ sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRect(x: MonLabel.frame.origin.x, y: MonLabel.frame.origin.y, width: MonLabel.frame.size.width, height: MonLabel.frame.size.height)
        if (selectDays[0] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            MonLabel.textColor = UIColor.white
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            MonLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        }
        selectDays[0] = 1 - selectDays[0]
        checkDoneButtonState()
        MonLabel.frame = frame
    }
    
    func TuelabelAction(_ sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRect(x: TueLabel.frame.origin.x, y: TueLabel.frame.origin.y, width: TueLabel.frame.size.width, height: TueLabel.frame.size.height)
        if (selectDays[1] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            TueLabel.textColor = UIColor.white
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            TueLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        }
        selectDays[1] = 1 - selectDays[1]
        checkDoneButtonState()
        TueLabel.frame = frame
    }
    
    func WedlabelAction(_ sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRect(x: WedLabel.frame.origin.x, y: WedLabel.frame.origin.y, width: WedLabel.frame.size.width, height: WedLabel.frame.size.height)
        if (selectDays[2] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            WedLabel.textColor = UIColor.white
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            WedLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        }
        selectDays[2] = 1 - selectDays[2]
        checkDoneButtonState()
        WedLabel.frame = frame
    }
    
    func ThulabelAction(_ sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRect(x: ThuLabel.frame.origin.x, y: ThuLabel.frame.origin.y, width: ThuLabel.frame.size.width, height: ThuLabel.frame.size.height)
        if (selectDays[3] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            ThuLabel.textColor = UIColor.white
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            ThuLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        }
        selectDays[3] = 1 - selectDays[3]
        checkDoneButtonState()
        ThuLabel.frame = frame
    }
    
    func FrilabelAction(_ sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRect(x: FriLabel.frame.origin.x, y: FriLabel.frame.origin.y, width: FriLabel.frame.size.width, height: FriLabel.frame.size.height)
        if (selectDays[4] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            FriLabel.textColor = UIColor.white
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            FriLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        }
        selectDays[4] = 1 - selectDays[4]
        checkDoneButtonState()
        FriLabel.frame = frame
    }
    
    func SatlabelAction(_ sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRect(x: SatLabel.frame.origin.x, y: SatLabel.frame.origin.y, width: SatLabel.frame.size.width, height: SatLabel.frame.size.height)
        if (selectDays[5] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            SatLabel.textColor = UIColor.white
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            SatLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        }
        selectDays[5] = 1 - selectDays[5]
        checkDoneButtonState()
        SatLabel.frame = frame
    }
    
    func SunlabelAction(_ sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRect(x: SunLabel.frame.origin.x, y: SunLabel.frame.origin.y, width: SunLabel.frame.size.width, height: SunLabel.frame.size.height)
        if (selectDays[6] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            SunLabel.textColor = UIColor.white
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            SunLabel.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        }
        selectDays[6] = 1 - selectDays[6]
        checkDoneButtonState()
        SunLabel.frame = frame
    }
    
    func checkDoneButtonState() {
        if selectDays.contains(1) {
            self.doneBtn.isEnabled = true
        } else {
            self.doneBtn.isEnabled = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.alarmTitleLabel.text = Common.sharedInstance.getCurAlarmTitle()
        self.alarmMusicLabel.text = Common.sharedInstance.getMusicNameByIndex(Common.sharedInstance.getCurMusicIndex())
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        switch index {
        case 1:
            break
        case 2:
            let addAlarmTitleVC = self.storyboard?.instantiateViewController(withIdentifier: "AddAlarmTitleViewControllerIdentifier") as? AddAlarmTitleViewController
            self.navigationController?.pushViewController(addAlarmTitleVC!, animated: true)
            break
        case 3:
            let selectMusicVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectMusicViewControllerIdentifier") as? SelectMusicViewController
            self.navigationController?.pushViewController(selectMusicVC!, animated: true)
            break
        default:
            break
        }
    }
    
    
    @IBAction func doneBtnClick(_ sender: AnyObject) {
        
        var repeatDays: String = ""
        for (index, element) in selectDays.enumerated() {
            if element == 1 {
                switch index {
                case 0:
                    repeatDays += "Mon, "
                    break
                case 1:
                    repeatDays += "Tue, "
                    break
                case 2:
                    repeatDays += "Wed, "
                    break
                case 3:
                    repeatDays += "Thu, "
                    break
                case 4:
                    repeatDays += "Fri, "
                    break
                case 5:
                    repeatDays += "Sat, "
                    break
                case 6:
                    repeatDays += "Sun, "
                    break
                default:
                    break
                }
            }
        }
        
        if repeatDays.characters.count > 2 {
            repeatDays = repeatDays.substring(with: (repeatDays.startIndex ..< repeatDays.characters.index(repeatDays.endIndex, offsetBy: -2)))
            Common.sharedInstance.setCurRepeatDays(repeatDays)
        }

        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "HH:mm"
        var Time: String = dataFormatter.string(from: dataPicker.date)
        var tmpArr = Time.components(separatedBy: ":")
        
        if Int(tmpArr[0]) > 12 {
            Time = String(Int(tmpArr[0])! % 12)
            Common.sharedInstance.setIsAM("PM")
        } else {
            Time = tmpArr[0]
            Common.sharedInstance.setIsAM("AM")
        }
        
        if Int(tmpArr[0])! % 12 < 10 && !tmpArr[0].contains("0") {
            Time = "0" + Time
        }
        
        Time += ":"
        Time += tmpArr[1]
        
        Common.sharedInstance.setCurAlarmTime(Time)
        
        let alarm = Alarm(UUID: UUID().uuidString,date: dataPicker.date, time: Common.sharedInstance.getCurAlarmTime(), title: Common.sharedInstance.getCurAlarmTitle(), repeatDays: Common.sharedInstance.getCurRepeatDays(), isActive: true)
        AlarmList.sharedInstance.addAlarm(alarm) // schedule a local notification to persist this item
        
        _ = self.navigationController?.popViewController(animated: true);
    }
    
    @IBAction func backBtnClick(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}


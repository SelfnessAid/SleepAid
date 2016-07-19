//
//  AddAlarmViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/5/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit
import Foundation

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
    var selectDays = [NSInteger](count: 7, repeatedValue: 0)
    
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
        
        MonLabel.userInteractionEnabled = true
        TueLabel.userInteractionEnabled = true
        WedLabel.userInteractionEnabled = true
        ThuLabel.userInteractionEnabled = true
        FriLabel.userInteractionEnabled = true
        SatLabel.userInteractionEnabled = true
        SunLabel.userInteractionEnabled = true
        
        MonLabel.textColor = UIColor.blueColor()
        TueLabel.textColor = UIColor.blueColor()
        WedLabel.textColor = UIColor.blueColor()
        ThuLabel.textColor = UIColor.blueColor()
        FriLabel.textColor = UIColor.blueColor()
        SatLabel.textColor = UIColor.blueColor()
        SunLabel.textColor = UIColor.blueColor()
        
        self.doneBtn.enabled = false
        
        self.dataPicker.datePickerMode = UIDatePickerMode.Time
        self.dataPicker.timeZone = NSTimeZone.localTimeZone()
        self.dataPicker.locale = NSLocale.currentLocale()
        self.dataPicker.calendar = NSCalendar.currentCalendar()
        self.dataPicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        
        let backgroundImage = UIImage(named: "background.png")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .ScaleAspectFit
        self.tableView.backgroundView = imageView
        
        self.borderLabel.layer.cornerRadius = 5.0
        self.borderLabel.layer.borderColor = UIColor.init(red: 252.0/255.0, green: 207.0/255.0, blue: 87.0/255.0, alpha: 1.0).CGColor
        self.borderLabel.layer.borderWidth = 2.0

    }
    
    func MonlabelAction(sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRectMake(MonLabel.frame.origin.x, MonLabel.frame.origin.y, MonLabel.frame.size.width, MonLabel.frame.size.height)
        if (selectDays[0] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            MonLabel.textColor = UIColor.whiteColor()
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            MonLabel.textColor = UIColor.blueColor()
        }
        selectDays[0] = 1 - selectDays[0]
        checkDoneButtonState()
        MonLabel.frame = frame
    }
    
    func TuelabelAction(sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRectMake(TueLabel.frame.origin.x, TueLabel.frame.origin.y, TueLabel.frame.size.width, TueLabel.frame.size.height)
        if (selectDays[1] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            TueLabel.textColor = UIColor.whiteColor()
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            TueLabel.textColor = UIColor.blueColor()
        }
        selectDays[1] = 1 - selectDays[1]
        checkDoneButtonState()
        TueLabel.frame = frame
    }
    
    func WedlabelAction(sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRectMake(WedLabel.frame.origin.x, WedLabel.frame.origin.y, WedLabel.frame.size.width, WedLabel.frame.size.height)
        if (selectDays[2] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            WedLabel.textColor = UIColor.whiteColor()
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            WedLabel.textColor = UIColor.blueColor()
        }
        selectDays[2] = 1 - selectDays[2]
        checkDoneButtonState()
        WedLabel.frame = frame
    }
    
    func ThulabelAction(sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRectMake(ThuLabel.frame.origin.x, ThuLabel.frame.origin.y, ThuLabel.frame.size.width, ThuLabel.frame.size.height)
        if (selectDays[3] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            ThuLabel.textColor = UIColor.whiteColor()
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            ThuLabel.textColor = UIColor.blueColor()
        }
        selectDays[3] = 1 - selectDays[3]
        checkDoneButtonState()
        ThuLabel.frame = frame
    }
    
    func FrilabelAction(sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRectMake(FriLabel.frame.origin.x, FriLabel.frame.origin.y, FriLabel.frame.size.width, FriLabel.frame.size.height)
        if (selectDays[4] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            FriLabel.textColor = UIColor.whiteColor()
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            FriLabel.textColor = UIColor.blueColor()
        }
        selectDays[4] = 1 - selectDays[4]
        checkDoneButtonState()
        FriLabel.frame = frame
    }
    
    func SatlabelAction(sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRectMake(SatLabel.frame.origin.x, SatLabel.frame.origin.y, SatLabel.frame.size.width, SatLabel.frame.size.height)
        if (selectDays[5] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            SatLabel.textColor = UIColor.whiteColor()
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            SatLabel.textColor = UIColor.blueColor()
        }
        selectDays[5] = 1 - selectDays[5]
        checkDoneButtonState()
        SatLabel.frame = frame
    }
    
    func SunlabelAction(sender:UITapGestureRecognizer) {
        var frame : CGRect = CGRectMake(SunLabel.frame.origin.x, SunLabel.frame.origin.y, SunLabel.frame.size.width, SunLabel.frame.size.height)
        if (selectDays[6] == 0) {
            frame.origin.y = frame.origin.y - 10          //pass the cordinate which you want
            SunLabel.textColor = UIColor.whiteColor()
        } else {
            frame.origin.y = frame.origin.y + 10          //pass the cordinate which you want
            SunLabel.textColor = UIColor.blueColor()
        }
        selectDays[6] = 1 - selectDays[6]
        checkDoneButtonState()
        SunLabel.frame = frame
    }
    
    func checkDoneButtonState() {
        if selectDays.contains(1) {
            self.doneBtn.enabled = true
        } else {
            self.doneBtn.enabled = false
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.alarmTitleLabel.text = Common.sharedInstance.getCurAlarmTitle()
        self.alarmMusicLabel.text = Common.sharedInstance.getMusicNameByIndex(Common.sharedInstance.getCurMusicIndex())
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        
        switch index {
        case 1:
            break
        case 2:
            let addAlarmTitleVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddAlarmTitleViewControllerIdentifier") as? AddAlarmTitleViewController
            self.navigationController?.pushViewController(addAlarmTitleVC!, animated: true)
            break
        case 3:
            let selectMusicVC = self.storyboard?.instantiateViewControllerWithIdentifier("SelectMusicViewControllerIdentifier") as? SelectMusicViewController
            self.navigationController?.pushViewController(selectMusicVC!, animated: true)
            break
        default:
            break
        }
    }
    
    
    @IBAction func doneBtnClick(sender: AnyObject) {
        
        var repeatDays: String = ""
        for (index, element) in selectDays.enumerate() {
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
            repeatDays = repeatDays.substringWithRange(Range<String.Index>(start: repeatDays.startIndex, end: repeatDays.endIndex.advancedBy(-2)))
            Common.sharedInstance.setCurRepeatDays(repeatDays)
        }

        let dataFormatter = NSDateFormatter()
        dataFormatter.dateFormat = "HH:mm"
        var Time: String = dataFormatter.stringFromDate(dataPicker.date)
        var tmpArr = Time.componentsSeparatedByString(":")
        
        if Int(tmpArr[0]) > 12 {
            Time = String(Int(tmpArr[0])! % 12)
            Common.sharedInstance.setIsAM("PM")
        } else {
            Time = tmpArr[0]
            Common.sharedInstance.setIsAM("AM")
        }
        
        if Int(tmpArr[0])! % 12 < 10 && !tmpArr[0].containsString("0") {
            Time = "0" + Time
        }
        
        Time += ":"
        Time += tmpArr[1]
        
        Common.sharedInstance.setCurAlarmTime(Time)
        
        let alarm = Alarm(UUID: NSUUID().UUIDString,date: dataPicker.date, time: Common.sharedInstance.getCurAlarmTime(), title: Common.sharedInstance.getCurAlarmTitle(), repeatDays: Common.sharedInstance.getCurRepeatDays(), isActive: true)
        AlarmList.sharedInstance.addAlarm(alarm) // schedule a local notification to persist this item
        
        self.navigationController?.popViewControllerAnimated(true);
    }
    
    @IBAction func backBtnClick(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}


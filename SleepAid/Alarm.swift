//
//  Alarm.swift
//  SleepAid
//
//  Created by MobileStar on 6/8/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import Foundation
import UIKit

class Alarm {
    private(set) var UUID: String
    private(set) var title: String
    private(set) var time: String
    private(set) var repeatDays: String
    private(set) var isAM: String
    private(set) var isActive: Bool
    private(set) var fireDate:NSDate
    
    enum Transportation: String {
        case Automobile = "Automobile"
        case Transit = "Transit"
    }
    
    /* CONSTRUCTORS */
    
    init () {
        self.UUID = NSUUID().UUIDString
        self.isActive = true
        self.time = ""
        self.title = "Wake up"
        self.repeatDays = ""
        self.isAM = "AM"
        self.fireDate = NSDate()
    }
    
    init (UUID: String = NSUUID().UUIDString,date: NSDate, time: String, title: String, repeatDays: String, isActive: Bool) {
//        let dateFormatter: NSDateFormatter = NSDateFormatter()
//        dateFormatter.locale = NSLocale.currentLocale()
//        dateFormatter.dateFormat = "HH:mm:ss";
//        let strTime: String = dateFormatter.stringFromDate(date);
//        NSLog("%@", strTime)
        
        self.UUID = UUID
        self.isActive = isActive
        self.time = time
        self.title = title
        self.repeatDays = repeatDays
        self.isAM = "AM"
        self.fireDate = date
    }
    
    init (copiedAlarm: Alarm) {
        self.UUID = copiedAlarm.UUID
        self.isActive = copiedAlarm.isActive
        self.time = copiedAlarm.time
        self.title = copiedAlarm.title
        self.repeatDays = copiedAlarm.repeatDays
        self.isAM = copiedAlarm.isAM
        self.fireDate = copiedAlarm.fireDate
    }
    
    /* METHODS */
    
    func copy() -> Alarm {
        return Alarm(copiedAlarm: self)
    }
    
    func turnOn () {
        self.isActive = true
    }
    
    func turnOff () {
        self.isActive = false
    }

    /* ACCESS CONTROL METHODS */
    
    func setUUID (newID: String) {
        self.UUID = newID
    }
    
    func setTime (time: String) {
        self.time = time
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func setRepeatDays(repeatdays: String) {
        self.repeatDays = repeatdays
    }
    
    func setIsAM(isAM: String) {
        self.isAM = isAM
    }
    
    /* SERIALIZATION */
    
    func toDictionary () -> NSDictionary {
        let dict: NSDictionary = [
            "UUID": self.UUID,
            "isActive": self.isActive,
            "time": self.time,
            "title": self.title,
            "repeatDays": self.repeatDays,
            "isAM": self.isAM,
            "fireDate": self.fireDate
        ]
        return dict
    }
    
    func fromDictionary (dict: NSDictionary) {
        self.UUID = dict.valueForKey("UUID") as! String
        self.isActive = dict.valueForKey("isActive") as! Bool
        self.time = dict.valueForKey("time") as! String
        self.title = dict.valueForKey("title") as! String
        self.repeatDays = dict.valueForKey("repeatDays") as! String
        self.isAM = dict.valueForKey("isAM") as! String
        self.fireDate = dict.valueForKey("fireDate") as! NSDate
    }
    
    var isOverdue: Bool {
        return (NSDate().compare(self.fireDate) == NSComparisonResult.OrderedDescending) // deadline is earlier than current date
    }
}

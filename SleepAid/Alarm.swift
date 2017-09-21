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
    fileprivate(set) var UUID: String
    fileprivate(set) var title: String
    fileprivate(set) var time: String
    fileprivate(set) var repeatDays: String
    fileprivate(set) var isAM: String
    fileprivate(set) var isActive: Bool
    fileprivate(set) var fireDate:Date
    
    enum Transportation: String {
        case Automobile = "Automobile"
        case Transit = "Transit"
    }
    
    /* CONSTRUCTORS */
    
    init () {
        self.UUID = Foundation.UUID().uuidString
        self.isActive = true
        self.time = ""
        self.title = "Wake up"
        self.repeatDays = ""
        self.isAM = "AM"
        self.fireDate = Date()
    }
    
    init (UUID: String = Foundation.UUID().uuidString,date: Date, time: String, title: String, repeatDays: String, isActive: Bool) {
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
    
    func setUUID (_ newID: String) {
        self.UUID = newID
    }
    
    func setTime (_ time: String) {
        self.time = time
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func setRepeatDays(_ repeatdays: String) {
        self.repeatDays = repeatdays
    }
    
    func setIsAM(_ isAM: String) {
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
    
    func fromDictionary (_ dict: NSDictionary) {
        self.UUID = dict.value(forKey: "UUID") as! String
        self.isActive = dict.value(forKey: "isActive") as! Bool
        self.time = dict.value(forKey: "time") as! String
        self.title = dict.value(forKey: "title") as! String
        self.repeatDays = dict.value(forKey: "repeatDays") as! String
        self.isAM = dict.value(forKey: "isAM") as! String
        self.fireDate = dict.value(forKey: "fireDate") as! Date
    }
    
    var isOverdue: Bool {
        return (Date().compare(self.fireDate) == ComparisonResult.orderedDescending) // deadline is earlier than current date
    }
}

//
//  AlarmList.swift
//  SleepAid
//
//  Created by MobileStar on 6/8/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import Foundation
import UIKit


class AlarmList {
    private let ALARMS_KEY = "alarmItems"
    
    /* SINGLETON CONSTRUCTOR */
    
    class var sharedInstance: AlarmList {
        struct Static {
            static let instance: AlarmList = AlarmList()
        }
        return Static.instance
    }
    
    /* ALARM FUNCTIONS */
    
    func allAlarms () -> [Alarm] {
        let alarmDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(ALARMS_KEY) ?? Dictionary()
        var alarmItems:[Alarm] = []
        
        for data in alarmDictionary.values {
            let dict = data as! NSDictionary
            let alarm = Alarm()
            alarm.fromDictionary(dict)
            alarmItems.append(alarm)
        }
        return alarmItems
    }
    
    func addAlarm (newAlarm: Alarm) {
        // Create persistent dictionary of data
        var alarmDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(ALARMS_KEY) ?? Dictionary()
        
        // Copy alarm object into persistent data
        alarmDictionary[newAlarm.UUID] = newAlarm.toDictionary()
        
        // Save or overwrite data
        NSUserDefaults.standardUserDefaults().setObject(alarmDictionary, forKey: ALARMS_KEY)
        
        let notification = UILocalNotification()
        notification.alertBody = "Alarm Item \"\(newAlarm.title)\" Is Overdue" // text that will be displayed in the notification
        notification.alertAction = "open" // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        notification.fireDate = newAlarm.fireDate // todo item due date (when notification will be fired)
        notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        notification.userInfo = ["UUID": newAlarm.UUID, ] // assign a unique identifier to the notification so that we can retrieve it later
        notification.category = "Alarm_CATEGORY"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
//        // Schedule notifications
        scheduleNotification(newAlarm, category: "ALARM_CATEGORY")
//        scheduleNotification(newAlarm, category: "FOLLOWUP_CATEGORY")
    }
    
    func removeAlarm (alarmToRemove: Alarm) {
        // Remove alarm notifications
        cancelNotification(alarmToRemove, category: "ALARM_CATEGORY")
//        cancelNotification(alarmToRemove, category: "FOLLOWUP_CATEGORY")
//        
//        // Remove alarm from persistent data
        if var alarmDictionary = NSUserDefaults.standardUserDefaults().dictionaryForKey(ALARMS_KEY) {
            alarmDictionary.removeValueForKey(alarmToRemove.UUID as String)
            NSUserDefaults.standardUserDefaults().setObject(alarmDictionary, forKey: ALARMS_KEY)
        }
        
        for notification in UIApplication.sharedApplication().scheduledLocalNotifications! { // loop through notifications...
            if (notification.userInfo!["UUID"] as! String == alarmToRemove.UUID) { // ...and cancel the notification that corresponds to this TodoItem instance (matched by UUID)
                UIApplication.sharedApplication().cancelLocalNotification(notification) // there should be a maximum of one match on UUID
                break
            }
        }
        
        if var todoItems = NSUserDefaults.standardUserDefaults().dictionaryForKey(ALARMS_KEY) {
            todoItems.removeValueForKey(alarmToRemove.UUID)
            NSUserDefaults.standardUserDefaults().setObject(todoItems, forKey: ALARMS_KEY) // save/overwrite todo item list
        }
    }
    
    func updateAlarm (alarmToUpdate: Alarm) {
        // Remove old alarm
        removeAlarm(alarmToUpdate)
        
        // Create new unique IDs
        let newUUID = NSUUID().UUIDString
//        let newFollowupID = NSUUID().UUIDString
        
        // Associate with the alarm by updating IDs
        alarmToUpdate.setUUID(newUUID)
//        alarmToUpdate.setFollowupID(newFollowupID)
        
        // Reschedule new alarm
        addAlarm(alarmToUpdate)
    }
    
    /* NOTIFICATION FUNCTIONS */
    
    func scheduleNotification (alarm: Alarm, category: String) {
        let notification = UILocalNotification()
        notification.category = category
        notification.repeatInterval = NSCalendarUnit.Day
        
        switch category {
        case "ALARM_CATEGORY":
            notification.userInfo = ["UUID": alarm.UUID]
            notification.alertBody = "Set up notifications to remind yourself to go through the deep sleep treatment."
            notification.fireDate = alarm.fireDate
//            notification.soundName = "loud_alarm.caf"
            break
        default:
            print("ERROR SCHEDULING NOTIFICATION")
            return
        }
        
        // For debugging purposes
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        print("ALARM SCHEDULED FOR :", dateFormatter.stringFromDate(notification.fireDate!))
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func cancelNotification (alarm: Alarm, category: String) {
        var ID: String
        switch category {
        case "ALARM_CATEGORY":
            ID = alarm.UUID
            break
        default:
            print("ERROR CANCELLING NOTIFICATION")
            return
        }
        
        for event in UIApplication.sharedApplication().scheduledLocalNotifications! {
            let notification = event as UILocalNotification
            if (notification.userInfo!["UUID"] as! String == ID) {
                UIApplication.sharedApplication().cancelLocalNotification(notification)
                break
            }
        }
    }

}

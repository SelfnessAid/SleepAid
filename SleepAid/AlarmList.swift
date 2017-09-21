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
    fileprivate let ALARMS_KEY = "alarmItems"
    
    /* SINGLETON CONSTRUCTOR */
    
    class var sharedInstance: AlarmList {
        struct Static {
            static let instance: AlarmList = AlarmList()
        }
        return Static.instance
    }
    
    /* ALARM FUNCTIONS */
    
    func allAlarms () -> [Alarm] {
        let alarmDictionary = UserDefaults.standard.dictionary(forKey: ALARMS_KEY) ?? Dictionary()
        var alarmItems:[Alarm] = []
        
        for data in alarmDictionary.values {
            let dict = data as! NSDictionary
            let alarm = Alarm()
            alarm.fromDictionary(dict)
            alarmItems.append(alarm)
        }
        return alarmItems
    }
    
    func addAlarm (_ newAlarm: Alarm) {
        // Create persistent dictionary of data
        var alarmDictionary = UserDefaults.standard.dictionary(forKey: ALARMS_KEY) ?? Dictionary()
        
        // Copy alarm object into persistent data
        alarmDictionary[newAlarm.UUID] = newAlarm.toDictionary()
        
        // Save or overwrite data
        UserDefaults.standard.set(alarmDictionary, forKey: ALARMS_KEY)
        
        let notification = UILocalNotification()
        notification.alertBody = "Alarm Item \"\(newAlarm.title)\" Is Overdue" // text that will be displayed in the notification
        notification.alertAction = "open" // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        notification.fireDate = newAlarm.fireDate as Date // todo item due date (when notification will be fired)
        notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        notification.userInfo = ["UUID": newAlarm.UUID, ] // assign a unique identifier to the notification so that we can retrieve it later
        notification.category = "Alarm_CATEGORY"
        UIApplication.shared.scheduleLocalNotification(notification)
//        // Schedule notifications
        scheduleNotification(newAlarm, category: "ALARM_CATEGORY")
//        scheduleNotification(newAlarm, category: "FOLLOWUP_CATEGORY")
    }
    
    func removeAlarm (_ alarmToRemove: Alarm) {
        // Remove alarm notifications
        cancelNotification(alarmToRemove, category: "ALARM_CATEGORY")
//        cancelNotification(alarmToRemove, category: "FOLLOWUP_CATEGORY")
//        
//        // Remove alarm from persistent data
        if var alarmDictionary = UserDefaults.standard.dictionary(forKey: ALARMS_KEY) {
            alarmDictionary.removeValue(forKey: alarmToRemove.UUID as String)
            UserDefaults.standard.set(alarmDictionary, forKey: ALARMS_KEY)
        }
        
        for notification in UIApplication.shared.scheduledLocalNotifications! { // loop through notifications...
            if (notification.userInfo!["UUID"] as! String == alarmToRemove.UUID) { // ...and cancel the notification that corresponds to this TodoItem instance (matched by UUID)
                UIApplication.shared.cancelLocalNotification(notification) // there should be a maximum of one match on UUID
                break
            }
        }
        
        if var todoItems = UserDefaults.standard.dictionary(forKey: ALARMS_KEY) {
            todoItems.removeValue(forKey: alarmToRemove.UUID)
            UserDefaults.standard.set(todoItems, forKey: ALARMS_KEY) // save/overwrite todo item list
        }
    }
    
    func updateAlarm (_ alarmToUpdate: Alarm) {
        // Remove old alarm
        removeAlarm(alarmToUpdate)
        
        // Create new unique IDs
        let newUUID = UUID().uuidString
//        let newFollowupID = NSUUID().UUIDString
        
        // Associate with the alarm by updating IDs
        alarmToUpdate.setUUID(newUUID)
//        alarmToUpdate.setFollowupID(newFollowupID)
        
        // Reschedule new alarm
        addAlarm(alarmToUpdate)
    }
    
    /* NOTIFICATION FUNCTIONS */
    
    func scheduleNotification (_ alarm: Alarm, category: String) {
        let notification = UILocalNotification()
        notification.category = category
        notification.repeatInterval = NSCalendar.Unit.day
        
        switch category {
        case "ALARM_CATEGORY":
            notification.userInfo = ["UUID": alarm.UUID]
            notification.alertBody = "Set up notifications to remind yourself to go through the deep sleep treatment."
            notification.fireDate = alarm.fireDate as Date
//            notification.soundName = "loud_alarm.caf"
            break
        default:
            print("ERROR SCHEDULING NOTIFICATION")
            return
        }
        
        // For debugging purposes
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        print("ALARM SCHEDULED FOR :", dateFormatter.string(from: notification.fireDate!))
        
        UIApplication.shared.scheduleLocalNotification(notification)
    }
    
    func cancelNotification (_ alarm: Alarm, category: String) {
        var ID: String
        switch category {
        case "ALARM_CATEGORY":
            ID = alarm.UUID
            break
        default:
            print("ERROR CANCELLING NOTIFICATION")
            return
        }
        
        for event in UIApplication.shared.scheduledLocalNotifications! {
            let notification = event as UILocalNotification
            if (notification.userInfo!["UUID"] as! String == ID) {
                UIApplication.shared.cancelLocalNotification(notification)
                break
            }
        }
    }

}

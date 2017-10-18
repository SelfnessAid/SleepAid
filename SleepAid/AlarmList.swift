//
//  AlarmList.swift
//  SleepAid
//
//  Created by MobileStar on 6/8/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


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
        
        let repeatDays = newAlarm.repeatDays.components(separatedBy: ",")
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: newAlarm.fireDate)
        let minutes = calendar.component(.minute, from: newAlarm.fireDate)
        
        for day in repeatDays {
            let notification = UNMutableNotificationContent()
            notification.title = NSString.localizedUserNotificationString(forKey: newAlarm.title, arguments: nil)
            notification.body = NSString.localizedUserNotificationString(forKey: "Alarm Item \"\(newAlarm.title)\" Is Overdue", arguments: nil)
            
            notification.sound = UNNotificationSound.init(named: newAlarm.music + ".mp3")
//            notification.setValue("YES", forKeyPath: "shouldAlwaysAlertWhileAppIsForeground")
            
            var dateInfo = DateComponents()
            dateInfo.hour = hour
            dateInfo.minute = minutes
            switch day {
                case "Sun":
                    dateInfo.weekday = 0
                    break
                case "Mon":
                    dateInfo.weekday = 1
                    break
                case "Tue":
                    dateInfo.weekday = 2
                    break
                case "Wed":
                    dateInfo.weekday = 3
                    break
                case "Thu":
                    dateInfo.weekday = 4
                    break
                case "Fri":
                    dateInfo.weekday = 5
                    break
                case "Sat":
                    dateInfo.weekday = 6
                    break
                default:
                    break
            }
        
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: true)
            let request = UNNotificationRequest(identifier: newAlarm.UUID + day, content: notification, trigger: trigger)
            let center = UNUserNotificationCenter.current()
            center.add(request, withCompletionHandler: { (error) in
                if let theError = error {
                    print(theError.localizedDescription)
                }
            })
            
        }
    }
    
    func removeAlarm (_ alarmToRemove: Alarm) {
        
        let identifiers = alarmToRemove.repeatDays.components(separatedBy: ",").map { (day) -> String in
            return alarmToRemove.UUID + day
        }
        
        let center = UNUserNotificationCenter.current()
        
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
        // Remove alarm notifications
//        cancelNotification(alarmToRemove, category: "ALARM_CATEGORY")
//        cancelNotification(alarmToRemove, category: "FOLLOWUP_CATEGORY")
//        
//        // Remove alarm from persistent data
        if var alarmDictionary = UserDefaults.standard.dictionary(forKey: ALARMS_KEY) {
            alarmDictionary.removeValue(forKey: alarmToRemove.UUID as String)
            UserDefaults.standard.set(alarmDictionary, forKey: ALARMS_KEY)
        }
        
//        for notification in UIApplication.shared.scheduledLocalNotifications! { // loop through notifications...
//            if (notification.userInfo!["UUID"] as! String == alarmToRemove.UUID) { // ...and cancel the notification that corresponds to this TodoItem instance (matched by UUID)
//                UIApplication.shared.cancelLocalNotification(notification) // there should be a maximum of one match on UUID
//                break
//            }
//        }
//        
//        if var todoItems = UserDefaults.standard.dictionary(forKey: ALARMS_KEY) {
//            todoItems.removeValue(forKey: alarmToRemove.UUID)
//            UserDefaults.standard.set(todoItems, forKey: ALARMS_KEY) // save/overwrite todo item list
//        }
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

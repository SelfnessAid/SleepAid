//
//  Common.swift
//  SleepAid
//
//  Created by MobileStar on 6/6/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import Foundation

class Common {
    
    class var sharedInstance: Common {
        struct Static {
            static let instance = Common()
        }
        return Static.instance
    }
    
    
    var curAlarmTitle = "Wake up"
    
    var totalAlarms = 0
    
    func getCurAlarmTitle() -> String {
        return self.curAlarmTitle
    }
    
    func setCurAlarmTitle(title: String) {
        self.curAlarmTitle = title
    }
}


class Alarm {
    
    var alarmTitle = ""
    var alarmTime = ""
    var alarmIsAM = true
    var alarmMusicURL = ""
    var isActive = false
    
    func turnOn () {
        self.isActive = true
    }
    
    func turnOff () {
        self.isActive = false
    }
}

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
    var curRepeatDays = ""
    var curAlarmTime = "00:00"
    var curIsAM = "AM"

    
    let localMusics = ["Words to live by", "Sleep Peacefully Alarm", "To the end of the world"]
    var curMusicIndex = 0
    
    var totalAlarms = 0
    
    func getCurAlarmTitle() -> String {
        return self.curAlarmTitle
    }
    
    func setCurAlarmTitle(title: String) {
        self.curAlarmTitle = title
    }
    
    func getCurRepeatDays() -> String {
        return self.curRepeatDays
    }
    
    func setCurRepeatDays(repeatDays: String) {
        self.curRepeatDays = repeatDays
    }
    
    func getCurAlarmTime() -> String {
        return self.curAlarmTime
    }
    
    func setCurAlarmTime(time: String) {
        self.curAlarmTime = time
    }
    
    func getIsAM() -> String {
        return self.curIsAM
    }
    
    func setIsAM(isAM: String) {
        self.curIsAM = isAM
    }
    
    func getCurMusicIndex() -> Int {
        return self.curMusicIndex
    }
    
    func setCurMusicIndex( index: Int ) {
        self.curMusicIndex = index
    }
    
    func getMusicNameByIndex( index: Int ) -> String {
        return self.localMusics[index]
    }
}



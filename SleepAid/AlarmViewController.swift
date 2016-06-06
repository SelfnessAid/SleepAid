//
//  AlarmViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/3/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AlarmViewController: UITableViewController {
    override func viewWillAppear(animated: Bool) {
//        self.tableView.backgroundColor = UIColor.whiteColor()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("alarmCell", forIndexPath: indexPath) as! AlarmViewTableCell
        cell.alarmTime.text! = "08:30"
        cell.alarmDescription.text = "Alarm is good"
        cell.alarmToggle.tag = indexPath.row
        cell.alarmTitle.text! = "Wake up"

//        cell.alarmToggle.addTarget(self, action: Selector("toggleAlarm"), forControlEvents: UIControlEvents.ValueChanged)
//        cell.accessoryView = cell.alarmToggle
        return cell
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }
}

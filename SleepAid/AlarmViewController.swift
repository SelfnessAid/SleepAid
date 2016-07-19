//
//  AlarmViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/3/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AlarmViewController: UITableViewController {
    
    var alarms:[Alarm] = []
    let noDataLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
        
        let backgroundImage = UIImage(named: "background.png")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .ScaleAspectFit
        self.tableView.backgroundView = imageView
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        // Manage selection during editing mode
//        self.tableView.allowsSelection = false
//        self.tableView.setEditing(false, animated: true)
        self.tableView.allowsSelectionDuringEditing = true
        
        alarms = AlarmList.sharedInstance.allAlarms()
        
        // Check if empty
        noDataLabel.text = "No scheduled alarms"
        noDataLabel.font = UIFont(name: "Lato", size: 20)
        noDataLabel.textAlignment = NSTextAlignment.Center
        noDataLabel.textColor = UIColor(hue: 0.5833, saturation: 0.44, brightness: 0.36, alpha: 1.0)
        noDataLabel.alpha = 0.0
        refreshList()
        checkScheduledAlarms()

    }
    
    func refreshList() {
        alarms = AlarmList.sharedInstance.allAlarms()
        
        if (alarms.count >= 64) {
            self.navigationItem.rightBarButtonItem!.enabled = false // disable 'add' button
        }
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("alarmCell", forIndexPath: indexPath) as! AlarmViewTableCell
        cell.alarmTime.text! = alarms[indexPath.row].time
        cell.alarmDescription.text = alarms[indexPath.row].repeatDays
        cell.alarmToggle.tag = indexPath.row
        cell.alarmTitle.text! = alarms[indexPath.row].title
        cell.alarmIsAM.text! = alarms[indexPath.row].isAM

//        cell.alarmToggle.addTarget(self, action: Selector("toggleAlarm"), forControlEvents: UIControlEvents.ValueChanged)
//        cell.accessoryView = cell.alarmToggle
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            AlarmList.sharedInstance.removeAlarm(alarms[indexPath.row]) // remove from persistent data
            alarms.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            // Update tags for alarm state
            var t = 0
            for cell in tableView.visibleCells as! [AlarmViewTableCell] {
                t += 1
                cell.alarmToggle.tag = t
            }
            
            checkScheduledAlarms()
        }
    }
    
    func checkScheduledAlarms () {
        UIView.animateWithDuration(0.25, animations: {
            if self.alarms.count == 0 {
                self.noDataLabel.alpha = 1.0
            } else {
                self.noDataLabel.alpha = 0.0
            }
        })
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (self.editing != true) {
            let addAlarmVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddAlarmViewControllerIdentifier") as? AddAlarmViewController
            self.navigationController?.pushViewController(addAlarmVC!, animated: true)
        }
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "           ") { (action : UITableViewRowAction!, indexPath : NSIndexPath!) -> Void in
            AlarmList.sharedInstance.removeAlarm(self.alarms[indexPath.row]) // remove from persistent data
            self.alarms.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            // Update tags for alarm state
            var t = 0
            for cell in tableView.visibleCells as! [AlarmViewTableCell] {
                t += 1
                cell.alarmToggle.tag = t
            }
            
            self.checkScheduledAlarms()
        }

        deleteAction.backgroundColor = UIColor(patternImage: UIImage(named: "delete_button")!)
        return [deleteAction]
    }
    
}

//
//  NotifyViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/10/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class NotifyViewController: UITableViewController {
    var alarms:[Alarm] = []
    let noDataLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        // Manage selection during editing mode
        //        self.tableView.allowsSelection = false
        //        self.tableView.setEditing(false, animated: true)
        self.tableView.allowsSelectionDuringEditing = true
        
        alarms = AlarmList.sharedInstance.allAlarms()
        
        // Check if empty
        noDataLabel.text = "No scheduled alarms"
        noDataLabel.font = UIFont(name: "Lato", size: 20)
        noDataLabel.textAlignment = NSTextAlignment.center
        noDataLabel.textColor = UIColor(hue: 0.5833, saturation: 0.44, brightness: 0.36, alpha: 1.0)
        noDataLabel.alpha = 0.0
        refreshList()
        checkScheduledAlarms()
        
    }
    
    func refreshList() {
        alarms = AlarmList.sharedInstance.allAlarms()
        
        if (alarms.count >= 64) {
            self.navigationItem.rightBarButtonItem!.isEnabled = false // disable 'add' button
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notifyCell", for: indexPath) as! NotifyViewTableCell
        cell.alarmTime.text! = alarms[indexPath.row].time
        cell.alarmDescription.text = alarms[indexPath.row].repeatDays
        cell.alarmToggle.tag = indexPath.row
        cell.alarmTitle.text! = alarms[indexPath.row].title
        cell.alarmIsAM.text! = alarms[indexPath.row].isAM
        
        //        cell.alarmToggle.addTarget(self, action: Selector("toggleAlarm"), forControlEvents: UIControlEvents.ValueChanged)
        //        cell.accessoryView = cell.alarmToggle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AlarmList.sharedInstance.removeAlarm(alarms[indexPath.row]) // remove from persistent data
            alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Update tags for alarm state
            var t = 0
            for cell in tableView.visibleCells as! [NotifyViewTableCell] {
                t += 1
                cell.alarmToggle.tag = t
            }
            
            checkScheduledAlarms()
        }
    }
    
    func checkScheduledAlarms () {
        UIView.animate(withDuration: 0.25, animations: {
            if self.alarms.count == 0 {
                self.noDataLabel.alpha = 1.0
            } else {
                self.noDataLabel.alpha = 0.0
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.isEditing != true) {
            let addAlarmVC = self.storyboard?.instantiateViewController(withIdentifier: "AddAlarmViewControllerIdentifier") as? AddAlarmViewController
            self.navigationController?.pushViewController(addAlarmVC!, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction:UITableViewRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "           ") { (action : UITableViewRowAction!, indexPath : IndexPath!) -> Void in
            AlarmList.sharedInstance.removeAlarm(self.alarms[indexPath.row]) // remove from persistent data
            self.alarms.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Update tags for alarm state
            var t = 0
            for cell in tableView.visibleCells as! [NotifyViewTableCell] {
                t += 1
                cell.alarmToggle.tag = t
            }
            
            self.checkScheduledAlarms()
        }
        
        deleteAction.backgroundColor = UIColor(patternImage: UIImage(named: "delete_button")!)
        return [deleteAction]
    }
}

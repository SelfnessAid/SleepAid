//
//  SelectMusicViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/7/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class SelectMusicViewController: UITableViewController {
    
    let section = ["Ringstones", "Songs", "Take more songs"]
    
    let items = [["Words to live by", "Sleep Peacefully Alarm", "To the end of the world"], ["Pick a song"], ["Take more songs..."]]
    
    var selectedRow:Int = -1
    var beforeSelectedRow : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "background.png")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .ScaleAspectFit
        self.tableView.backgroundView = imageView
        
        selectedRow = -1
        beforeSelectedRow = -1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.section.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor =  UIColor(red: 0.09, green: 0.243, blue: 0.47, alpha: 1.0)
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.clearColor()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //variable type is inferred
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath) as! SelectMusicTableViewCell
        if indexPath.section == 0 {
            if beforeSelectedRow != selectedRow {
                if selectedRow == indexPath.row {
                    cell.checkboxImg.hidden = false
                } else {
                    cell.checkboxImg.hidden = true
                }
            }
        } else {
            cell.checkboxImg.hidden = true
        }
        cell.musicTitle.textColor = UIColor.whiteColor()
        cell.musicTitle.text = self.items[indexPath.section][indexPath.row]
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            Common.sharedInstance.setCurMusicIndex(indexPath.row)
            beforeSelectedRow = selectedRow
            selectedRow = indexPath.row
            self.tableView.reloadData()
            
            let PlayMusicVC = self.storyboard?.instantiateViewControllerWithIdentifier("PlayMusicViewControllerIdentifier") as? PlayMusicViewController
            self.navigationController?.pushViewController(PlayMusicVC!, animated: true)
        } else if indexPath.section == 1 {
            
        } else if indexPath.section == 2 {
            
        }
    }
    @IBAction func backBtnClick(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}

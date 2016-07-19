//
//  SettingsViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/10/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    let items = [["About Barry Zecca", "Subscribe to newsletter"], ["Tell me about your think", "Share on Facebook", "Share on Twitter"], ["FAQ", "Terms of use"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "background.png")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .ScaleAspectFit
        self.tableView.backgroundView = imageView
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
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        //variable type is inferred
        var cell = tableView.dequeueReusableCellWithIdentifier("settingsCell", forIndexPath: indexPath) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "settingsCell")
        }
        
        cell?.textLabel?.textColor = UIColor.whiteColor()
        cell!.textLabel?.text = self.items[indexPath.section][indexPath.row]
        
        return cell!
        
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let AboutAuthorVC = self.storyboard?.instantiateViewControllerWithIdentifier("AboutAuthorViewControllerIndentifier") as? AboutAuthorViewController
                self.navigationController?.pushViewController(AboutAuthorVC!, animated: true)
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let FAQVC = self.storyboard?.instantiateViewControllerWithIdentifier("FAQViewControllerIndentifier") as? FAQViewController
                self.navigationController?.pushViewController(FAQVC!, animated: true)
            }
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor =  UIColor(red: 0.09, green: 0.243, blue: 0.47, alpha: 1.0)
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.backgroundColor = UIColor.clearColor()
    }
}

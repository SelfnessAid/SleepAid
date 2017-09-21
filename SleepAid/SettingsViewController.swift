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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //variable type is inferred
        var cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as? UITableViewCell
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "settingsCell")
        }
        
        cell?.textLabel?.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        cell!.textLabel?.text = self.items[indexPath.section][indexPath.row]
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let AboutAuthorVC = self.storyboard?.instantiateViewController(withIdentifier: "AboutAuthorViewControllerIndentifier") as? AboutAuthorViewController
                self.navigationController?.pushViewController(AboutAuthorVC!, animated: true)
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let FAQVC = self.storyboard?.instantiateViewController(withIdentifier: "FAQViewControllerIndentifier") as? FAQViewController
                self.navigationController?.pushViewController(FAQVC!, animated: true)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor =  UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.backgroundColor = UIColor.clear
    }
}

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
        
        selectedRow = -1
        beforeSelectedRow = -1
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
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.section.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items[section].count
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor =  UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.contentView.backgroundColor = UIColor.clear
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //variable type is inferred
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! SelectMusicTableViewCell
        if indexPath.section == 0 {
            if beforeSelectedRow != selectedRow {
                if selectedRow == indexPath.row {
                    cell.checkboxImg.isHidden = false
                } else {
                    cell.checkboxImg.isHidden = true
                }
            }
        } else {
            cell.checkboxImg.isHidden = true
        }
        cell.musicTitle.textColor = UIColor.white
        cell.musicTitle.text = self.items[indexPath.section][indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            Common.sharedInstance.setCurMusicIndex(indexPath.row)
            beforeSelectedRow = selectedRow
            selectedRow = indexPath.row
            self.tableView.reloadData()
            
            let PlayMusicVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayMusicViewControllerIdentifier") as? PlayMusicViewController
            self.navigationController?.pushViewController(PlayMusicVC!, animated: true)
        } else if indexPath.section == 1 {
            
        } else if indexPath.section == 2 {
            
        }
    }
    @IBAction func backBtnClick(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}

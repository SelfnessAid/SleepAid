//
//  FAQViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/12/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class FAQViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var FAQTable: UITableView!
    
    let items = ["Questions goes here", "This is really I have no due as to long this question could go long"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.FAQTable.estimatedRowHeight = 80
        self.FAQTable.rowHeight = UITableViewAutomaticDimension
        self.FAQTable.setNeedsLayout()
        self.FAQTable.layoutIfNeeded()
        let backgroundImage = UIImage(named: "background.png")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.FAQTable.reloadData()
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FAQCell", forIndexPath: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFontOfSize(13.0)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let AnswerVC = self.storyboard?.instantiateViewControllerWithIdentifier("AnswerViewControllerIndentifier") as? AnswerViewController
        self.navigationController?.pushViewController(AnswerVC!, animated: true)
    }
}

//
//  AboutAuthorViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/10/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AboutAuthorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "background.png")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            let FAQVC = self.storyboard?.instantiateViewControllerWithIdentifier("FAQViewControllerIndentifier") as? FAQViewController
            self.navigationController?.pushViewController(FAQVC!, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("aboutAuthorCell", forIndexPath: indexPath)
        return cell
    }
    
    @IBAction func goAnswerByLabel(sender: AnyObject) {
        let AnswerVC = self.storyboard?.instantiateViewControllerWithIdentifier("AnswerViewControllerIndentifier") as? AnswerViewController
        self.navigationController?.pushViewController(AnswerVC!, animated: true)
    }
    @IBAction func goAnswer(sender: AnyObject) {
        let AnswerVC = self.storyboard?.instantiateViewControllerWithIdentifier("AnswerViewControllerIndentifier") as? AnswerViewController
        self.navigationController?.pushViewController(AnswerVC!, animated: true)
    }

}
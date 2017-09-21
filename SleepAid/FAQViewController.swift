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
//        self.FAQTable.estimatedRowHeight = 80
        self.FAQTable.rowHeight = UITableViewAutomaticDimension
        self.FAQTable.setNeedsLayout()
        self.FAQTable.layoutIfNeeded()

        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.FAQTable.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15.0)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.init(red: 131.0/255.0, green: 133/255.0, blue: 148/255, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let AnswerVC = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewControllerIndentifier") as? AnswerViewController
        self.navigationController?.pushViewController(AnswerVC!, animated: true)
    }
}

//
//  AboutAuthorViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/10/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AboutAuthorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.tintColor = UIColor.white
        profileImg.layer.cornerRadius = 75
        profileImg.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let FAQVC = self.storyboard?.instantiateViewController(withIdentifier: "FAQViewControllerIndentifier") as? FAQViewController
            self.navigationController?.pushViewController(FAQVC!, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aboutAuthorCell", for: indexPath)
        return cell
    }
    
    @IBAction func goAnswerByLabel(_ sender: AnyObject) {
        let AnswerVC = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewControllerIndentifier") as? AnswerViewController
        self.navigationController?.pushViewController(AnswerVC!, animated: true)
    }
    @IBAction func goAnswer(_ sender: AnyObject) {
        let AnswerVC = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewControllerIndentifier") as? AnswerViewController
        self.navigationController?.pushViewController(AnswerVC!, animated: true)
    }

}

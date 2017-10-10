//
//  PrivacyViewController.swift
//  SleepAid
//
//  Created by admin on 10/10/17.
//  Copyright © 2017 MobileStar. All rights reserved.
//

import UIKit

class PrivacyViewController: UIViewController {

    @IBOutlet weak var privacyTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "SleepAid_Privacy", ofType: "txt")!
        do {
            privacyTextView.text = try String(contentsOfFile: path)
        } catch { print("Error in contentsOfFile") }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

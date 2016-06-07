//
//  AddAlarmViewController.swift
//  SleepAid
//
//  Created by MobileStar on 6/5/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class AddAlarmViewController: UITableViewController {
    
    @IBOutlet weak var alarmTitleLabel: UILabel!
    @IBOutlet weak var MonLabel: UILabel!
    @IBOutlet weak var TueLabel: UILabel!
    @IBOutlet weak var WedLabel: UILabel!
    @IBOutlet weak var ThuLabel: UILabel!
    @IBOutlet weak var FriLabel: UILabel!
    @IBOutlet weak var SatLabel: UILabel!
    @IBOutlet weak var SunLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let Montap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.MonlabelAction(_:)))
        Montap.numberOfTapsRequired = 1
        
        let Tuetap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.TuelabelAction(_:)))
        Tuetap.numberOfTapsRequired = 1
        
        let Wedtap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.WedlabelAction(_:)))
        Wedtap.numberOfTapsRequired = 1
        
        let Thutap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.ThulabelAction(_:)))
        Thutap.numberOfTapsRequired = 1
        
        let Fritap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.FrilabelAction(_:)))
        Fritap.numberOfTapsRequired = 1
        
        let Sattap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.SatlabelAction(_:)))
        Sattap.numberOfTapsRequired = 1
        
        let Suntap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAlarmViewController.SunlabelAction(_:)))
        Suntap.numberOfTapsRequired = 1
        
        
        
        MonLabel.addGestureRecognizer(Montap)
        TueLabel.addGestureRecognizer(Tuetap)
        WedLabel.addGestureRecognizer(Wedtap)
        ThuLabel.addGestureRecognizer(Thutap)
        FriLabel.addGestureRecognizer(Fritap)
        SatLabel.addGestureRecognizer(Sattap)
        SunLabel.addGestureRecognizer(Suntap)
        
        MonLabel.userInteractionEnabled = true
        TueLabel.userInteractionEnabled = true
        WedLabel.userInteractionEnabled = true
        ThuLabel.userInteractionEnabled = true
        FriLabel.userInteractionEnabled = true
        SatLabel.userInteractionEnabled = true
        SunLabel.userInteractionEnabled = true
    }
    
    func MonlabelAction(sender:UITapGestureRecognizer) {
        CGRect; frame = MonLabel.frame;
        frame.origin.y=10;//pass the cordinate which you want
        frame.origin.x= 12;//pass the cordinate which you want
        MonLabel.frame= frame;
    }
    
    func TuelabelAction(sender:UITapGestureRecognizer) {
        print("Tue")
    }
    
    func WedlabelAction(sender:UITapGestureRecognizer) {
        print("Wed")
    }
    
    func ThulabelAction(sender:UITapGestureRecognizer) {
        print("Thu")
    }
    
    func FrilabelAction(sender:UITapGestureRecognizer) {
        print("Fri")
    }
    
    func SatlabelAction(sender:UITapGestureRecognizer) {
        print("Sat")
    }
    
    func SunlabelAction(sender:UITapGestureRecognizer) {
        print("Sun")
    }
    
    override func viewWillAppear(animated: Bool) {
        self.alarmTitleLabel.text = Common.sharedInstance.getCurAlarmTitle()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index = indexPath.row
        
        switch index {
        case 1:
            break
        case 2:
            let addAlarmTitleVC = self.storyboard?.instantiateViewControllerWithIdentifier("AddAlarmTitleViewControllerIdentifier") as? AddAlarmTitleViewController
            self.navigationController?.pushViewController(addAlarmTitleVC!, animated: true)
            break
        case 3:
            break
        default:
            break
        }
    }
    
    

}


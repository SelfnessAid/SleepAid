//
//  CustomTabBarController.swift
//  SleepAid
//
//  Created by MobileStar on 6/16/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbarColor = CAGradientLayer()
        tabbarColor.colors =  [UIColor.init(red: 19.0/255.0, green: 23.0/255.0, blue: 54.0/255.0, alpha: 1.0).CGColor, UIColor.init(red: 19.0/255.0, green: 21.0/255.0, blue: 51.0/255.0, alpha: 1.0).CGColor ]
        tabbarColor.startPoint = CGPoint(x: 0.0, y: 0.0)
        tabbarColor.endPoint = CGPoint(x: 0.0, y: 0.5)
        tabbarColor.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y, self.tabBar.bounds.width, self.tabBar.bounds.height)
        
        UIGraphicsBeginImageContext(tabbarColor.bounds.size)
        tabbarColor.renderInContext(UIGraphicsGetCurrentContext()!)
        let tabimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.tabBar.backgroundImage = tabimage
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.whiteColor()], forState: .Normal)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let tabbarColor = CAGradientLayer()
        tabbarColor.colors =  [UIColor.init(red: 19.0/255.0, green: 23.0/255.0, blue: 54.0/255.0, alpha: 1.0).CGColor, UIColor.init(red: 19.0/255.0, green: 21.0/255.0, blue: 51.0/255.0, alpha: 1.0).CGColor ]
        tabbarColor.startPoint = CGPoint(x: 0.0, y: 0.0)
        tabbarColor.endPoint = CGPoint(x: 0.0, y: 0.5)
        tabbarColor.frame = CGRectMake(self.tabBar.frame.origin.x, self.tabBar.frame.origin.y, self.tabBar.bounds.width, self.tabBar.bounds.height)
        
        UIGraphicsBeginImageContext(tabbarColor.bounds.size)
        tabbarColor.renderInContext(UIGraphicsGetCurrentContext()!)
        let tabimage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.tabBar.backgroundImage = tabimage
    }
}

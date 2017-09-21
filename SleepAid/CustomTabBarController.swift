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
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let tabbarColor = CAGradientLayer()
//        tabbarColor.colors =  [UIColor.init(red: 19.0/255.0, green: 23.0/255.0, blue: 54.0/255.0, alpha: 1.0).cgColor, UIColor.init(red: 19.0/255.0, green: 21.0/255.0, blue: 51.0/255.0, alpha: 1.0).cgColor ]
//        tabbarColor.startPoint = CGPoint(x: 0.0, y: 0.0)
//        tabbarColor.endPoint = CGPoint(x: 0.0, y: 0.5)
//        tabbarColor.frame = CGRect(x: self.tabBar.frame.origin.x, y: self.tabBar.frame.origin.y, width: self.tabBar.bounds.width, height: self.tabBar.bounds.height)
//        
//        UIGraphicsBeginImageContext(tabbarColor.bounds.size)
//        tabbarColor.render(in: UIGraphicsGetCurrentContext()!)
//        let tabimage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        self.tabBar.backgroundImage = tabimage
    }
}

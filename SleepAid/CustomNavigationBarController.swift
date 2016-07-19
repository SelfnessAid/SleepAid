//
//  CustomNavigationBarController.swift
//  SleepAid
//
//  Created by MobileStar on 6/16/16.
//  Copyright © 2016 MobileStar. All rights reserved.
//

import UIKit

class CustomNavigationBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.tintColor = UIColor.whiteColor()
        
        let navigationbarColor = CAGradientLayer()
        navigationbarColor.frame = self.navigationBar.bounds
        navigationbarColor.colors =  [UIColor.init(red: 23.0/255.0, green: 60.0/255.0, blue: 120.0/255.0, alpha: 1.0), UIColor.init(red: 23.0/255.0, green: 57.0/255.0, blue: 117.0/255.0, alpha: 1.0) ].map{$0.CGColor}
        navigationbarColor.startPoint = CGPoint(x: 0.0, y: 0.0)
        navigationbarColor.endPoint = CGPoint(x: 0.0, y: 0.5)
        UIGraphicsBeginImageContext(navigationbarColor.bounds.size)
        navigationbarColor.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.navigationBar.setBackgroundImage(image, forBarMetrics: UIBarMetrics.Default)
        self.navigationBar.shadowImage  = UIImage()
    }
}

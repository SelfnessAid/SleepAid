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
    }
}

extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        let screenRect = UIScreen.main.bounds
        return CGSize(width: screenRect.size.width, height: 60)
    }
}

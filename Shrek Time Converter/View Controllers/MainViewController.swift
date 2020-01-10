//
//  MainViewController.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 6/21/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class MainViewController : UITabBarController {
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    func setUpViews() {
        view.backgroundColor = .lightGreen
    }
    
    
}

//
//  ShrekTitleLabel.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 12/30/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class ShrekTitleLable: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpLabel()
    }
    
    func setUpLabel() {
        textColor = .darkGreen
        font = UIFont.init(name: "AvenirNext-Bold", size: 35)
        
        backgroundColor = .clear
    }
    
}

//
//  ShrekLabel.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 7/1/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class ShrekLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpLabel()
    }
    
    func setUpLabel() {
        
        textColor = .white
        font = UIFont.init(name: "AvenirNext-Bold", size: 25)
        
        backgroundColor = .clear
    }
}

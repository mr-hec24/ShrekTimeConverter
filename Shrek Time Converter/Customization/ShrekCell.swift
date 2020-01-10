//
//  ShrekCell.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 7/17/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class ShrekCell : UITableViewCell {
    
    var label: UILabel!
    var switchButton: UISwitch!
    
    
    
    func setCell(option: Option) {
        label.text = option.title
        switchButton.isHidden = !(option.triggerable)
        
        switchButton.isOn = false
        
        backgroundColor = .lightGreen
        
        let margins = self.layoutMarginsGuide
        
        label.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10.0).isActive = true
        switchButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -10.0).isActive = true
    
        label.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: 0.0).isActive = true
        switchButton.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
    
    }
}

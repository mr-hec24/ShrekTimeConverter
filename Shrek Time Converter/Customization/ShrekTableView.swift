//
//  ShrekTableView.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 7/6/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class ShrekTableView : UITableView {
   
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setUpTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpTableView()
    }
    
    override func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        super.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func setUpTableView() {
        backgroundColor = .lightGreen
    }
    
}

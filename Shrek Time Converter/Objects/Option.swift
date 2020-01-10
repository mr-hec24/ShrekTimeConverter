//
//  Option.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 7/17/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class Option {
    var title : String = ""
    var triggerable : Bool = false
    
    init (title: String, isTriggerable: Bool) {
        self.title = title
        self.triggerable = isTriggerable
    }
}

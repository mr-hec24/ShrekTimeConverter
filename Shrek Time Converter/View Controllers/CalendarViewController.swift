//
//  CalendarViewController.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 6/21/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class CalendarViewController : UIViewController {
    let options = OptionsViewController()
    var isDarkMode = true
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGreen
        
        options.delegate = self
        options.downloadData()
    }
    
    @IBAction func updateMode(_ sender: UISwitch) {
        isDarkMode = sender.isOn
        updateTheme()
    }
    
    func updateTheme() {
        self.view.backgroundColor = self.isDarkMode ? .darkGreen : .lightGreen
    }
    
    override func viewDidAppear(_ animated: Bool) {
        options.downloadData()
    }
}

extension CalendarViewController: Delegate {
    func didRecieveModePreference(_ data: Bool) {
        print("\(data). This was recieved in the Calendar View")
        
        isDarkMode = data
    }
    
}

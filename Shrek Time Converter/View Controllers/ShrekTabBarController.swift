//
//  ShrekTabBarController.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 12/30/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class ShrekTabBarController: UITabBarController {
    let options = OptionsViewController()
    
    var isDarkMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        options.delegate = self
        options.downloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        options.downloadData()
    }
    
    @IBAction func changePrefferredMode(_ sender: UISwitch) {
        print("The UISwitch has been pressed")
    }
    @IBAction func testing(_ sender: Any) {
        print("The UISwitch had been pressed (PRIME)")
    }
    
    func updatePrefferredMode() {
        options.view.backgroundColor = .darkGreen
    }
}

extension ShrekTabBarController: Delegate {
    func didRecieveModePreference(_ data: Bool) {
        print("\(data) Recieved in the ShrekTabBarController")
        updatePrefferredMode()
    }
}

//
//  OptionsViewController.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 6/21/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit
import MessageUI

class OptionsViewController : UIViewController {
    
    // Lots of Variables, just in case they are needed
    @IBOutlet var optionsTitle: ShrekTitleLable!
    
    @IBOutlet var darkThemeLabel: ShrekLabel!
    @IBOutlet var darkThemeSwitch: UISwitch!
    
    @IBOutlet var primeMembershipLabel: ShrekLabel!
    @IBOutlet var primeMembershipSwitch: UISwitch!
    
    @IBOutlet var helpButton : ShrekButton!
    
    @IBOutlet var creditsButton: ShrekButton!
    
    weak var delegate: Delegate?
    
    var isDarkMode = false
    let defaults = UserDefaults.standard
    
    struct Keys {
        static let prefersDarkMode = "prefersDarkMode"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGreen
        
    }
    
    func downloadData() {
        let data = self.isDarkMode
        delegate?.didRecieveModePreference(data)
    }
    
    /*
     The following 2 methods are actions methods for when a button is pressed
     */
    @IBAction func clickOnInfoButton(_ sender: ShrekButton) {
        sender.shakeButton()
        
    }
    
    @IBAction func clickOnHelpButton(_ sender: ShrekButton) {
        sender.shakeButton()
        showMailComposer()
    }
    
    /*
     Quite simply, this displays a mail composer
     */
    func showMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            //Show alert informing user
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["harmandorod24@gmail.com"])
        composer.setSubject("HELP!")
        composer.setMessageBody("I love your app, but there are a few things I am worried about:", isHTML: false)
        
        present(composer, animated: true)
        
    }
    
    
    /*
     The Following 4 Methods focus on updating the theme of this View Controller
     */
    @IBAction func changeTheme(_ sender: UISwitch) {
        isDarkMode = sender.isOn
        
        performSegue(withIdentifier: "darkMode", sender: self)
        
        saveStylePreference()
        downloadData()
        updateStyle()
    }
    
    func updateStyle() {
        UIView.animate(withDuration: 0.4) {
            self.view.backgroundColor = self.isDarkMode ? .darkGreen : .lightGreen
            
            self.optionsTitle.textColor = self.isDarkMode ? .lightGreen : .darkGreen
            
          
            self.helpButton.backgroundColor = self.isDarkMode ? .lightGreen : .darkGreen
            self.creditsButton.backgroundColor = self.isDarkMode ? .lightGreen : .darkGreen
        }
    }
    
    func saveStylePreference() {
        defaults.set(isDarkMode, forKey: Keys.prefersDarkMode)
    }
    
    func checkForStylePreference() {
        let prefersDarkMode = defaults.bool(forKey: Keys.prefersDarkMode)
        
        if prefersDarkMode {
            isDarkMode = true
            updateStyle()
            darkThemeSwitch.isOn = isDarkMode
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tabController = segue.destination as? ShrekTabBarController {
            tabController.view.backgroundColor =  self.isDarkMode ? .darkGreen : .lightGreen
            
        }
        
        if let calendar = segue.destination as? CalendarViewController {
            calendar.view.backgroundColor =  self.isDarkMode ? .darkGreen : .lightGreen
        }
        
        if let calculator = segue.destination as? CalculatorViewController {
            calculator.view.backgroundColor =  self.isDarkMode ? .darkGreen : .lightGreen
        }
    }
}

protocol Delegate: class {
    func didRecieveModePreference(_ data: Bool)
}

extension OptionsViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //Show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed To Send")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        }
        
        controller.dismiss(animated: true)
    }
}


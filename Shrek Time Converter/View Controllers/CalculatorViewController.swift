//
//  CalculatorViewController.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 6/21/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class CalculatorViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var startingUnitPicker: UIPickerView!
    @IBOutlet weak var endingUnitPicker: UIPickerView!
    @IBOutlet var resultLabel: ShrekLabel!
    @IBOutlet var convertButton: ShrekButton!
    
    private let pickerOptions = ["Seconds",
                                 "Minutes",
                                 "Time",
                                 "Shreks",
                                 "Hours",
                                 "Days",
                                 "Weeks",
                                 "Months",
                                 "Years"]
    
    override func viewDidLoad() {
        setPickerViews()
        view.backgroundColor = .lightGreen
    }
    
    @IBAction func onButtonPressed(_ sender: ShrekButton) {
        
        convertButton.shakeButton()
        let startingUnitRow = startingUnitPicker.selectedRow(inComponent: 0)
        
        let endingUnitRow = endingUnitPicker.selectedRow(inComponent: 0)
        
        let startingUnitQuantity : Double? = Double(textField.text!)
        
        let title = convertTime(starting: startingUnitRow, ending: endingUnitRow, quantity: startingUnitQuantity!)
        
        resultLabel.text = title
    }
    
    func convertTime(starting: Int, ending: Int, quantity: Double) -> String {
        let endingValue = pickerOptions[ending]
        var newQuantity : Double = quantity
        
        if starting == ending {   // Catch Case
            
            if (endingValue == "Time") {
                let firstNumber : Int = Int(quantity / 60)
                let secondNumber: Int = Int(quantity) - (firstNumber * 60)
                
                return "\(firstNumber):\(secondNumber) Military Time"
            }
            if (endingValue == "Shreks") {
                let firstNumber = Int(quantity / 95)
                let secondNumber = Int(quantity) - (firstNumber * 95)
                
                return "\(firstNumber):\(secondNumber) Shreks"
            }
            
            return "\(quantity) \(endingValue)"
        }
        
        guard starting > ending else {
            
            
            switch (starting) {
            case 0: do {
                // Converting From Seconds to Minutes
                newQuantity = quantity/60
                break
                }
            case 1: do {
                //Converting From Minutes to Time
                break
                }
            case 2: do {
                // Converting From Time to Shreks
                break
                }
            case 3: do {
                // Converting From Shreks to Hours
                newQuantity = quantity/60
                break
                }
            case 4: do {
                // Converting From Hours to Days
                newQuantity = quantity/24
                break
                }
            case 5: do {
                // Converting From Days to Weeks
                newQuantity = quantity/7
                break
                }
            case 6: do {
                // Converting From Weeks to Months
                newQuantity = quantity/4.345
                break
                }
            case 7: do {
                // Converting From Months to Years
                newQuantity = quantity/12
                break
                }
            default: do {
                break
                }
            }
            
            return  convertTime(starting: starting + 1, ending: ending, quantity: newQuantity)
        }
        
        
        switch (starting) {
        case 1: do {
            // Converting From Minutes to Seconds
            newQuantity = quantity * 60
            break
            }
        case 2: do {
            // Converting From Time to Minutes
            break
            }
        case 3: do {
            // Converting From Shreks to Time
            break
            }
        case 4: do {
            // Converting From Hours to Shreks
            newQuantity = quantity * 60
            //Actually converts to minutes to make things easier lol
            break
            }
        case 5: do {
            // Converting From Days to Hours
            newQuantity = quantity * 24
            break
            }
        case 6: do {
            // Converting From Weeks to Days
            newQuantity = quantity * 7
            break
            }
        case 7: do {
            // Converting From Months to Weeks
            newQuantity = quantity * 4.345
            break
            }
        case 8: do {
            // Converting From Years to Months
            newQuantity = quantity * 12
            break
            }
        default: do {
            break
            }
        }
        
        return  convertTime(starting: starting - 1, ending: ending, quantity: newQuantity)
    }
    
    func toMinutes(value: Int, number: Int) -> Int{
        guard value == 2 else {
            // Input code that converts
            return 1
        }
        
        // Input code that converts Shreks into minutes
        return 0
    }
    
    // Picker Data Source Methods
    func numberOfComponents(in pickerView:  UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerOptions.count
    }

    // Picker Delegate Methos
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    
    func setPickerViews() {
        self.endingUnitPicker.delegate = self
        self.startingUnitPicker.delegate = self
        
        self.endingUnitPicker.dataSource = self
        self.startingUnitPicker.dataSource = self
    }
}

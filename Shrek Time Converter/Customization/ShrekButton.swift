//
//  ShrekButton.swift
//  Shrek Time Converter
//
//  Created by Junior Rodriguez on 7/1/19.
//  Copyright © 2019 Cholesterol Club. All rights reserved.
//

import UIKit

class ShrekButton : UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    
    func setUpButton() {
        setShadow()
        
        setTitleColor(.white, for: .normal)
        
        backgroundColor = .darkGreen
        titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 15)
        layer.cornerRadius = 25
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.darkGray.cgColor
    }
    
    
    
    private func setShadow() {
        layer.shadowColor = UIColor.green.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius = 8
        layer.shadowOpacity = 1
        clipsToBounds = true
        layer.masksToBounds = true
    }
    
    func shakeButton() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 8, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 8, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: "position")
    }
    
}


extension UIColor {
    @objc class var darkGreen: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "DarkGreen")!
        } else {
            return .green
        }
    }
    
    @objc class var lightGreen : UIColor {
        if #available(iOS 11.0, *) {
            return UIColor(named: "LightGreen")!
        } else {
            return .green
        }
    }
}

//
//  CustomButton.swift
//  Calculator
//
//  Created by AKIN on 26.09.2022.
//

import UIKit

class NumberBaseButton: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 20
        self.layer.backgroundColor = UIColor.darkGray.cgColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: 42)
        self.setTitleColor(.white, for: .normal)
    }
}

class OperatorBaseButton: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 20
        self.layer.backgroundColor = CGColor(#colorLiteral(red: 0.6289473176, green: 0.7607721686, blue: 0.8355754614, alpha: 1))
        self.titleLabel?.font = UIFont.systemFont(ofSize: 42)
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.systemOrange, for: .disabled)
    }
}

class SpecialOperatorBaseButton: UIButton {
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 20
        self.layer.backgroundColor = UIColor.white.cgColor
        self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.setTitleColor(UIColor(named: "Color"), for: .normal)
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(backgroundImage, for: state)
    }
}

//
//  CalculatorViewController+NibExtension.swift
//  Calculator
//
//  Created by AKIN on 28.09.2022.
//

import UIKit

extension UIViewController {
    public static func loadNib<T : UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
}

//
//  CalculatorProtocol.swift
//  Calculator
//
//  Created by AKIN on 28.09.2022.
//

import UIKit
import AVFoundation

protocol CalculatorActionsProtocols: CalculatorViewController, AVAudioPlayerDelegate {
    ///tıklanan buttondan alınan sayıları tuttuğumuz ve ekranda gösterdiğimiz değişken
    var operations: String { get set }
    
    func addToWorkings(value: String)
    func specialCharacter (char: Character) -> Bool
    func formatResult(result: Double) -> String
    func secondPowerAction()
    func powersOfTenAction()
    func squareAction()
    func factorialAction()
    func clearAll()
    func deleteAction()
    func validInput() -> Bool
    func equalsAction()
    func playSound()
}

extension CalculatorActionsProtocols {
    // MARK: - FUNCTIONS
    ///IBAction'ların içerisinde çağırdığımız fonksiyonlar extension ile buradan çekildi, kod okunurluğuna pozitif katkı amacıyla.
    
    func playSound() {
        audioPlayer = try? AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
    func addToWorkings(value: String) {
        operations = operations + value
        operationsLabel.text = operations
    }
    
    func specialCharacter (char: Character) -> Bool {
        if (char == "*") {
            return true
        }
        if (char == "/") {
            return true
        }
        if (char == "+") {
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    
    func secondPowerAction() {
        guard var number = Int(operations) else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "First enter the number then choose action.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        number = number * number
        resultLabel.text = String(number)
    }
    
    func powersOfTenAction() {
        guard let power = Int(operations) else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "First enter the number then choose action.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        var result = 1
        if (power > 0) {
            for _ in 1...power {
                result *= 10
            }
            resultLabel.text = String(result)
        } else {
            resultLabel.text = "0"
        }
    }
    
    func squareAction() {
        guard let square = Double(operations)  else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "First enter the number then choose action.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        resultLabel.text = String(sqrt(square))
    }
    
    func factorialAction() {
        guard let factorial = Double(operations) else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "First enter the number then choose action.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        var result = 1
        if (Int(factorial) > 0) {
            for i in 1...Int(factorial) {
                result *= i
            }
        }
        resultLabel.text = String(result)
    }
    func clearAll() {
        operations = ""
        operationsLabel.text = ""
        resultLabel.text = ""
    }
    
    func deleteAction() {
        if (!operations.isEmpty) {
            operations.removeLast()
            operationsLabel.text = operations
        }
    }
    
    func validInput() -> Bool {
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in operations {
            if (specialCharacter(char: char)) {
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if (index == 0) {
                return false
            }
            
            if (index == operations.count - 1) {
                return false
            }
            
            if (previous != -1) {
                if (index - previous == 1) {
                    return false
                }
            }
            previous = index
        }
        return true
    }
    
    func equalsAction() {
        if (validInput()) {
            let checkedWorkingsForPercent = operations.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            resultLabel.text = resultString
        } else {
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math based on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

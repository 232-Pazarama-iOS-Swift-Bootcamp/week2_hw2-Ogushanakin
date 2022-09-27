//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by AKIN on 26.09.2022.
//

import UIKit
import AVFoundation

final class CalculatorViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var operations: String = ""
    private var audioPlayer : AVAudioPlayer!
    private let url = Bundle.main.url(forResource: "click", withExtension: "wav")
    
    // MARK: - UI Elements
    
    @IBOutlet weak var operationsLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    // MARK: - ACTIONS
    
    @IBAction func equalsButton(_ sender: Any) {
        playSound()
        equalsAction()
    }
    
    @IBAction func acButton(_ sender: UIButton) {
        playSound()
        clearAll()
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        playSound()
        deleteAction()
    }
    
    @IBAction func squareButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "√")
    }
    
    @IBAction func percentButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "%")
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "/")
    }
    
    @IBAction func timesButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "*")
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "-")
    }
    
    @IBAction func plusButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "+")
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: ".")
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "0")
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "1")
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "2")
    }
    
    @IBAction func threeButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "3")
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "4")
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "5")
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "6")
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "7")
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "8")
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "9")
    }
    
    
    // MARK: - FUNCTIONS
    
    private func addToWorkings(value: String) {
        operations = operations + value
        operationsLabel.text = operations
    }
    
    private func specialCharacter (char: Character) -> Bool {
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
    
    private func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
    
    
}

extension CalculatorViewController: CalculatorOperations {
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

extension CalculatorViewController: AVAudioPlayerDelegate {
    private func playSound() {
        audioPlayer = try? AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
}

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
    ///tıklanan buttondan alınan sayıları tuttuğumuz ve ekranda gösterdiğimiz değişken
    private lazy var operations: String = ""
    ///button tıklanma sesleri
    private var audioPlayer : AVAudioPlayer!
    private let url = Bundle.main.url(forResource: "click", withExtension: "wav")
    
    // MARK: - UI Elements
    ///İşlemleri gördüğümüz ve sonucu gönderdiğimiz iki label.
    @IBOutlet weak var operationsLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    // MARK: - ACTIONS
    ///Her butona ilgili fonksiyonları atandı.
    @IBAction func powersOfTenButton(_ sender: Any) {
        playSound()
        powersOfTenAction()
    }
    
    @IBAction func piNumberButton(_ sender: UIButton) {
        playSound()
        addToWorkings(value: "3.14")
    }
    
    @IBAction func xFactorial( _ sender: UIButton) {
        playSound()
        factorialAction()
    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
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
        let square = Double(operations)
        resultLabel.text = String(sqrt(square!))
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
}

extension CalculatorViewController {
    
    // MARK: - FUNCTIONS
    ///IBAction'ların içerisinde çağırdığımız fonksiyonlar extension ile buradan çekildi, kod okunurluğuna pozitif katkı amacıyla.
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
    
    private func powersOfTenAction() {
        let power = Int(operations)
        var result = 1
        if (power! > 0) {
            for _ in 1...power! {
                result *= 10
            }
            resultLabel.text = String(result)
        } else {
            resultLabel.text = "0"
        }
    }
    
    private func factorialAction() {
        let factorial = Double(operations)
        var result = 1
        if (Int(factorial!) > 0) {
            for i in 1...Int(factorial!) {
                result *= i
            }
        }
        resultLabel.text = String(result)
    }
    private func clearAll() {
        operations = ""
        operationsLabel.text = ""
        resultLabel.text = ""
    }
    
    private func deleteAction() {
        if (!operations.isEmpty) {
            operations.removeLast()
            operationsLabel.text = operations
        }
    }
    
    private func validInput() -> Bool {
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
    
    private func equalsAction() {
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

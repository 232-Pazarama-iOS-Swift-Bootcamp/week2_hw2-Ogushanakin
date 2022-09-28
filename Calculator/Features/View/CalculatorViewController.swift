//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by AKIN on 26.09.2022.
//

import UIKit
import AVFoundation

final class CalculatorViewController: UIViewController, CalculatorActionsProtocols {
    
    // MARK: - Properties
    ///tıklanan buttondan alınan sayıları tuttuğumuz ve ekranda gösterdiğimiz değişken
    var operations: String = ""
    
    ///button tıklanma sesleri
    var audioPlayer : AVAudioPlayer!
    var url = Bundle.main.url(forResource: "click", withExtension: "wav")
    
    // MARK: - UI Elements
    ///İşlemleri gördüğümüz ve sonucu gönderdiğimiz iki label.
    @IBOutlet var operationsLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    // MARK: - ACTIONS
    ///Her butona ilgili fonksiyonları atandı.
    @IBAction func secondPowerofNumberButton(_ sender: UIButton) {
        playSound()
        secondPowerAction()
    }
    @IBAction func powersOfTenButton(_ sender: UIButton) {
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
        squareAction()
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


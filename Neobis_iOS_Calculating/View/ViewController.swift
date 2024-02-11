//
//  ViewController.swift
//  Neobis_iOS_Calculating
//
//  Created by Игорь Пачкин on 4/2/24.
//

import UIKit

class ViewController: UIViewController {

    
    let mainView = MainUIView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupMainViewConstraints()
        setupAllTargets()
    }
    

    private func setupMainViewConstraints(){
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    
    private func setupAllTargets() {
        mainView.clearButton.addTarget(self, action: #selector(clearPressed), for: .touchUpInside)
        mainView.negativeButton.addTarget(self, action: #selector(negativePressed), for: .touchUpInside)
        mainView.percentageButton.addTarget(self, action: #selector(percentagePressed), for: .touchUpInside)
        mainView.dotButton.addTarget(self, action: #selector(dotPressed), for: .touchUpInside)
        
        mainView.button0.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button4.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button5.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button6.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button7.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button8.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        mainView.button9.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        
        
    }

    
    @objc func numberPressed(_ sender: UIButton) {
        let tag = sender.tag
        
        if mainView.number.text == "0" {
            mainView.number.text = "\(tag)"
        } else if mainView.number.text == "-0" {
            mainView.number.text = "\(-tag)"
        }else if let text = mainView.number.text {
            mainView.number.text = "\(text)\(tag)"
        }
    }
    
    @objc func clearPressed() {
        //operationPressed = false
        //changeOperationButton()
        mainView.number.text = "0"
        //currentOperation = nil
        //firstNumber = 0
    }
    
    @objc func negativePressed(_ sender: UIButton){
        if let text = mainView.number.text, let value = Double(text.replacingOccurrences(of: ",", with: ".")) {
            mainView.number.text = "\(removeTrailingZeros(from: -value))"
        }
    }
    
    @objc func percentagePressed(_ sender: UIButton){
        if let text = mainView.number.text, let value = Double(text.replacingOccurrences(of: ",", with: ".")) {
            if value != 0 {
                mainView.number.text = "\(removeTrailingZeros(from: value / 100.0))"
            }
        }
    }
    
    @objc func dotPressed(_ sender: UIButton){
        if let text = mainView.number.text, let value = Double(text.replacingOccurrences(of: ",", with: ".")) {
            if value != 0 {
                mainView.number.text = "\(removeTrailingZeros(from: value / 100.0))"
            }
        }
    }
    
    func removeTrailingZeros(from number: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 5
        if let formattedString = numberFormatter.string(from: NSNumber(value: number)) {
            return formattedString
        } else {
            return "\(number)"
        }
    }
}


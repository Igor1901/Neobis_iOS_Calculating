//
//  ViewController.swift
//  Neobis_iOS_Calculating
//
//  Created by Игорь Пачкин on 4/2/24.
//

import UIKit

class ViewController: UIViewController {

    
    let mainView = MainUIView()
    let viewModel = ViewModel()
    
    var firstNumber = 0.0
    var secondNumber = 0.0
    var currentOperation: Operation?
    var operationPressed = false
    var equalShouldBePressed = false
        
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        //setupMainViewConstraints()
        setupGestureRecognizers()
        setupAllTargets()
    }
    

    
    
    private func setupGestureRecognizers() {
            // Добавляем Gesture Recognizer для смахивания вправо
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            
            swipeRightGestureRecognizer.direction = .right
            swipeRightGestureRecognizer.allowedTouchTypes = [NSNumber(value: UITouch.TouchType.direct.rawValue)]
        mainView.gestureRecognizersView.addGestureRecognizer(swipeRightGestureRecognizer)
            
            // Добавляем Gesture Recognizer для смахивания влево
            let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            swipeLeftGestureRecognizer.direction = .left
            swipeLeftGestureRecognizer.allowedTouchTypes = [NSNumber(value: UITouch.TouchType.direct.rawValue)]
        mainView.gestureRecognizersView.addGestureRecognizer(swipeLeftGestureRecognizer)
        }
    
    @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            print("право")
            // Проверяем, что текст не равен "0"
            guard let text = mainView.number.text, text != "0" else {
                return // Если текст равен "0", ничего не делаем
            }

            // Уменьшаем на один разряд, если число больше 0
            if let value = Int(text), value > 0 {
                let newValue = value / 10 // Уменьшаем на один разряд
                mainView.number.text = "\(newValue)" // Обновляем текст
            }
        } else if sender.direction == .left {
            print("лево")
            // Проверяем, что текст не равен "0"
            guard let text = mainView.number.text, text != "0" else {
                return // Если текст равен "0", ничего не делаем
            }

            // Уменьшаем на один разряд, если число больше 0
            if let value = Int(text), value > 0 {
                let newValue = value / 10 // Уменьшаем на один разряд
                mainView.number.text = "\(newValue)" // Обновляем текст
            }
        }
    }


    
    private func setupAllTargets() {
        mainView.clearButton.addTarget(self, action: #selector(clearPressed), for: .touchUpInside)
        mainView.negativeButton.addTarget(self, action: #selector(negativePressed), for: .touchUpInside)
        mainView.percentageButton.addTarget(self, action: #selector(percentagePressed), for: .touchUpInside)
        mainView.dotButton.addTarget(self, action: #selector(dotPressed), for: .touchUpInside)
        
        [mainView.button0, mainView.button1, mainView.button2, mainView.button3, mainView.button4, mainView.button5, mainView.button6, mainView.button7, mainView.button8, mainView.button9].forEach {$0.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)}
        
        [mainView.divideButton, mainView.multiplyButton, mainView.minusButton, mainView.plusButton, mainView.equalButton].forEach {$0.addTarget(self, action: #selector(operationPressed(_:)), for: .touchUpInside)}
 
    }

    
    @objc func numberPressed(_ sender: UIButton) {
        let tag = sender.tag
        
        if mainView.number.text == "0" || operationPressed{
            mainView.number.text = "\(tag)"
            
            if operationPressed {
                operationPressed = false
                changeOperationButton()
            }
        } else if mainView.number.text == "-0" {
            mainView.number.text = "\(-tag)"
        }else if let text = mainView.number.text {
            mainView.number.text = "\(text)\(tag)"
        }
    }
    
    @objc func clearPressed() {
        operationPressed = false
        //changeOperationButton()
        mainView.number.text = "0"
        currentOperation = nil
        firstNumber = 0
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
                mainView.number.text = mainView.number.text?.appending(",")
            }
        }
    }
    
    @objc func operationPressed(_ sender: UIButton) {
        let tag = sender.tag
        if let text = mainView.number.text, let value = Double(text.replacingOccurrences(of: ",", with: ".")) {
            
            if operationPressed {
                operationPressed = false
                //changeOperationButton()
                equalShouldBePressed = false
            }
            
            if equalShouldBePressed {
                equalPressed()
            }
            
            switch tag {
            case 13:
                print("нажал")
                currentOperation = .divide
                firstNumber = value
                operationPressed = true
                mainView.divideButton.backgroundColor = .white
                mainView.divideButton.setTitleColor(.trueOrange(), for: .normal)
                changeOperationButton()
                equalShouldBePressed = true
                print(firstNumber)
                break
            case 14:
                currentOperation = .multiply
                firstNumber = value
                operationPressed = true
                changeOperationButton()
                equalShouldBePressed = true
                break
            case 15:
                currentOperation = .subtract
                firstNumber = value
                operationPressed = true
                changeOperationButton()
                equalShouldBePressed = true
                break
            case 16:
                currentOperation = .add
                firstNumber = value
                operationPressed = true
                changeOperationButton()
                equalShouldBePressed = true
                break
            case 18:
                equalPressed()
                break
            default:
                break
            }
        }
}
    
    
    func equalPressed() {
        if !equalShouldBePressed {return}
        equalShouldBePressed = false
        if let operation = currentOperation {
            var secondNumber = 0.0
            if let text = mainView.number.text, let value = Double(text.replacingOccurrences(of: ",", with: ".")) {
                secondNumber = value
            }
            
            print("First: \(firstNumber) | Second: \(secondNumber)")
            switch operation {
            case .add:
                let result = firstNumber + secondNumber
                mainView.number.text = removeTrailingZeros(from: result)
                firstNumber = result
                break
            case .subtract:
                let result = firstNumber - secondNumber
                mainView.number.text = removeTrailingZeros(from: result)
                firstNumber = result
                break
            case .multiply:
                let result = firstNumber * secondNumber
                mainView.number.text = removeTrailingZeros(from: result)
                firstNumber = result
                break
            case .divide:
                if secondNumber == 0 {
                    mainView.number.text = "Error"
                    firstNumber = 0
                    break
                }
                let result = firstNumber / secondNumber
                mainView.number.text = removeTrailingZeros(from: result)
                firstNumber = result
                break
            default:
                break
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
    
    func changeOperationButton() {
        switch currentOperation {
        case .add:
            mainView.plusButton.backgroundColor = operationPressed ? .white : .trueOrange()
            mainView.plusButton.setTitleColor(operationPressed ? .trueOrange() : .white, for: .normal)
            break
        case .subtract:
            mainView.minusButton.backgroundColor = operationPressed ? .white : .trueOrange()
            mainView.minusButton.setTitleColor(operationPressed ? .trueOrange() : .white, for: .normal)
            break
        case .multiply:
            mainView.multiplyButton.backgroundColor = operationPressed ? .white : .trueOrange()
            mainView.multiplyButton.setTitleColor(operationPressed ? .trueOrange() : .white, for: .normal)
            break
        case .divide:
            mainView.divideButton.backgroundColor = operationPressed ? .white : .trueOrange()
            mainView.divideButton.setTitleColor(operationPressed ? .trueOrange() : .white, for: .normal)
            break
        default:
            break
        }
    }
}


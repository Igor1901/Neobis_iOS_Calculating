//
//  ViewController.swift
//  Neobis_iOS_Calculating
//
//  Created by Игорь Пачкин on 4/2/24.
//

import UIKit

class ViewController: UIViewController {

    lazy var number: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 65)
        label.textColor = .white
        label.textAlignment = .right
        label.text = "0"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    lazy var firstRow: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var clearButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 40
        button.backgroundColor = .lightGray
        button.setTitle("C", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return button
    }()
    
    lazy var negativeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 40
        button.backgroundColor = .lightGray
        button.setTitle("+/-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        return button
    }()
    
    lazy var percentageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 40
        button.setTitle("%", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        return button
    }()
    lazy var divideButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 40
        button.setTitle("÷", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        return button
    }()
    
    //MARK: SecondRow
    
    lazy var secondRow: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var button7: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("7", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return button
    }()
    lazy var button8: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("8", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return button
    }()
    lazy var button9: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("9", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return button
    }()
    lazy var multiplyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 40
        button.setTitle("×", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        return button
    }()
    
    
    
    //MARK: Third row
    
    lazy var thirdRow: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var button4: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("4", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.tag = 4
        return button
    }()
    lazy var button5: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("5", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.tag = 5
        return button
    }()
    lazy var button6: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("6", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.tag = 6
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 40
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        button.tag = 5
        return button
    }()
    
    //MARK: Forth row
    lazy var forthRow: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()

    lazy var button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("1", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.tag = 1
        return button
    }()
    lazy var button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("2", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.tag = 2
        return button
    }()
    lazy var button3: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("3", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.tag = 3
        return button
    }()
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 40
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.tag = 6
        return button
    }()
    
    
    //MARK: Fifth row
    lazy var fifthRow: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var button0: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle("0", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .leading
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        button.tag = 0
        return button
    }()
    
    lazy var dotButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.cornerRadius = 40
        button.setTitle(",", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.tag = 7
        return button
    }()
    
    lazy var equalButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .orange
        button.layer.cornerRadius = 40
        button.setTitle("=", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        button.tag = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(number)
        view.addSubview(firstRow)
        firstRow.addArrangedSubview(clearButton)
        firstRow.addArrangedSubview(negativeButton)
        firstRow.addArrangedSubview(percentageButton)
        firstRow.addArrangedSubview(divideButton)
        view.addSubview(secondRow)
        secondRow.addArrangedSubview(button7)
        secondRow.addArrangedSubview(button8)
        secondRow.addArrangedSubview(button9)
        secondRow.addArrangedSubview(multiplyButton)
        view.addSubview(thirdRow)
        thirdRow.addArrangedSubview(button4)
        thirdRow.addArrangedSubview(button5)
        thirdRow.addArrangedSubview(button6)
        thirdRow.addArrangedSubview(minusButton)
        view.addSubview(forthRow)
        forthRow.addArrangedSubview(button1)
        forthRow.addArrangedSubview(button2)
        forthRow.addArrangedSubview(button3)
        forthRow.addArrangedSubview(plusButton)
        view.addSubview(fifthRow)
        fifthRow.addArrangedSubview(button0)
        fifthRow.addArrangedSubview(dotButton)
        fifthRow.addArrangedSubview(equalButton)
        
        
        
        [number, firstRow, clearButton, negativeButton, percentageButton, divideButton, secondRow, button7, button8, button9, multiplyButton, thirdRow, button4, button5, button6, minusButton, forthRow, button1, button2, button3, plusButton, fifthRow, button0, dotButton, equalButton].forEach {$0.translatesAutoresizingMaskIntoConstraints = false}
        
        NSLayoutConstraint.activate([
            number.topAnchor.constraint(equalTo: view.topAnchor, constant: 239),
            number.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            number.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            firstRow.topAnchor.constraint(equalTo: number.bottomAnchor, constant: 15),
            firstRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            firstRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            firstRow.heightAnchor.constraint(equalToConstant: 80),
            
            clearButton.heightAnchor.constraint(equalToConstant: 80),
            clearButton.widthAnchor.constraint(equalToConstant: 80),
            
            negativeButton.heightAnchor.constraint(equalToConstant: 80),
            negativeButton.widthAnchor.constraint(equalToConstant: 80),
            
            percentageButton.heightAnchor.constraint(equalToConstant: 80),
            percentageButton.widthAnchor.constraint(equalToConstant: 80),
            
            divideButton.heightAnchor.constraint(equalToConstant: 80),
            divideButton.widthAnchor.constraint(equalToConstant: 80),
            
            secondRow.topAnchor.constraint(equalTo: firstRow.bottomAnchor, constant: 15),
            secondRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            secondRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            secondRow.heightAnchor.constraint(equalToConstant: 80),
            
            button7.heightAnchor.constraint(equalToConstant: 80),
            button7.widthAnchor.constraint(equalToConstant: 80),
            
            button8.heightAnchor.constraint(equalToConstant: 80),
            button8.widthAnchor.constraint(equalToConstant: 80),
            
            button9.heightAnchor.constraint(equalToConstant: 80),
            button9.widthAnchor.constraint(equalToConstant: 80),
            
            multiplyButton.heightAnchor.constraint(equalToConstant: 80),
            multiplyButton.widthAnchor.constraint(equalToConstant: 80),
            
            thirdRow.topAnchor.constraint(equalTo: secondRow.bottomAnchor, constant: 15),
            thirdRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            thirdRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            thirdRow.heightAnchor.constraint(equalToConstant: 80),
            
            button4.heightAnchor.constraint(equalToConstant: 80),
            button4.widthAnchor.constraint(equalToConstant: 80),
            
            button5.heightAnchor.constraint(equalToConstant: 80),
            button5.widthAnchor.constraint(equalToConstant: 80),
            
            button6.heightAnchor.constraint(equalToConstant: 80),
            button6.widthAnchor.constraint(equalToConstant: 80),
            
            minusButton.heightAnchor.constraint(equalToConstant: 80),
            minusButton.widthAnchor.constraint(equalToConstant: 80),
            
            forthRow.topAnchor.constraint(equalTo: thirdRow.bottomAnchor, constant: 15),
            forthRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            forthRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            forthRow.heightAnchor.constraint(equalToConstant: 80),
            
            button1.heightAnchor.constraint(equalToConstant: 80),
            button1.widthAnchor.constraint(equalToConstant: 80),
            
            button2.heightAnchor.constraint(equalToConstant: 80),
            button2.widthAnchor.constraint(equalToConstant: 80),
            
            button3.heightAnchor.constraint(equalToConstant: 80),
            button3.widthAnchor.constraint(equalToConstant: 80),
            
            plusButton.heightAnchor.constraint(equalToConstant: 80),
            plusButton.widthAnchor.constraint(equalToConstant: 80),
            
            fifthRow.topAnchor.constraint(equalTo: forthRow.bottomAnchor, constant: 15),
            fifthRow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            fifthRow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            fifthRow.heightAnchor.constraint(equalToConstant: 80),
            
            button0.heightAnchor.constraint(equalToConstant: 80),
            button0.widthAnchor.constraint(equalToConstant: 160),
            
            dotButton.heightAnchor.constraint(equalToConstant: 80),
            dotButton.widthAnchor.constraint(equalToConstant: 80),
            
            equalButton.heightAnchor.constraint(equalToConstant: 80),
            equalButton.widthAnchor.constraint(equalToConstant: 80),
        ])
        
    }
    /*
    private func DynamicH(_ height: Double) -> Double {
        return UIScreen.main.bounds.height * height / 896
    }
    
    private func DynamicW(_ width: Double) -> Double {
        return UIScreen.main.bounds.width * width / 414
    }
    */

}


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
        } else if let text = mainView.number.text {
            mainView.number.text = "\(text)\(tag)"
        }
    }
    
}


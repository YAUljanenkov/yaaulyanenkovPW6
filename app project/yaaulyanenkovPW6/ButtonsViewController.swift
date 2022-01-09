//
//  ButtonsViewController.swift
//  yaaulyanenkovPW6
//
//  Created by Ярослав Ульяненков on 08.01.2022.
//

import UIKit
import MyLogger1
import MyLogger2
import MyLogger3
import MyLogger4

class ButtonsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupButtons()
    }
    
    func setupButtons() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let buttons = [setupButton(name: "Log (framework)", selector: #selector(firstButtonPressed),
                                   color: .systemCyan),
                       setupButton(name: "Log (swift package)", selector: #selector(secondButtonPressed), color: .systemMint),
                       setupButton(name: "Log (pod)", selector: #selector(thirdButtonPressed), color: .systemTeal),
                       setupButton(name: "Log (carthage)", selector: #selector(fourthButtonPressed), color: .systemIndigo),
        ]
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
        view.addSubview(stackView)
        stackView.pin(to: view, [.left, .top, .right, .bottom], 16)
    }
    
    func setupButton(name: String, selector: Selector, color: UIColor) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.setTitle(name, for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: button.intrinsicContentSize.width + 18, height: 40)
        button.setTitleColor(.systemGray6, for: .normal)
        button.backgroundColor = color
        return button
    }
    
    @objc func firstButtonPressed() {
        MyLogger1.log("hello, world")
    }
    
    @objc func secondButtonPressed() {
        MyLogger2.log("hello, world")
    }
    
    @objc func thirdButtonPressed() {
        MyLogger3.log("hello, world")
    }
    
    @objc func fourthButtonPressed() {
        MyLogger4.log("hello, world")
    }
}

//
//  FirstViewController.swift
//  MemoryLeakage
//
//  Created by Murad on 24.12.22.
//

import UIKit

class FirstViewController: UIViewController {

    var completion: RetainClass = RetainClass()

    private lazy var button1: UIButton = {
        let button = UIButton()

        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("LEAKING", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(onTapLeaking), for: .touchUpInside)

        return button
    }()

    private lazy var button2: UIButton = {
        let button = UIButton()

        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("NON-LEAKING", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(onTapNonLeaking), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.button1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button1.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.button1.widthAnchor.constraint(equalToConstant: 240.0),
            self.button1.heightAnchor.constraint(equalToConstant: 48.0)
        ])

        NSLayoutConstraint.activate([
            self.button2.topAnchor.constraint(equalTo: self.button1.bottomAnchor, constant: 16.0),
            self.button2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button2.widthAnchor.constraint(equalToConstant: 240.0),
            self.button2.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }

    @objc func onTapLeaking() {
        let secondVCReference = SecondViewController()

        secondVCReference.completion = { vc in
            self.completion = vc
            print(secondVCReference)
        }
        
        secondVCReference.modalPresentationStyle = .overFullScreen
        self.present(secondVCReference, animated: true)
    }

    @objc func onTapNonLeaking() {
        let secondVCReference = ThirdViewController()
        secondVCReference.modalPresentationStyle = .overFullScreen
        self.present(secondVCReference, animated: true)
    }
}


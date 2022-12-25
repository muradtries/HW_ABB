//
//  FirstViewController.swift
//  MemoryLeakage
//
//  Created by Murad on 24.12.22.
//

import UIKit

class FirstViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton()

        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forward", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(onTapNavigate), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.button.widthAnchor.constraint(equalToConstant: 240.0),
            self.button.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }

    @objc func onTapNavigate() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
}


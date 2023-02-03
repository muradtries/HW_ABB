//
//  ThirdViewController.swift
//  MemoryLeakage
//
//  Created by Murad on 03.02.23.
//

import UIKit

class ThirdViewController: UIViewController {

    var retainList: [RetainClass] = []
    var retainObject: RetainClass = RetainClass()

    private lazy var button: UIButton = {
        let button = UIButton()

        self.view.addSubview(button)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 16.0
        button.addTarget(self, action: #selector(onTapNavigate), for: .touchUpInside)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
        self.setupConstraints()

        // THIS IS JUST FOR INCREASING MEMORY IN A VISIBLE SCALE
        DispatchQueue.global().async {
            for _ in 0...500_000 {
                self.retainList.append(RetainClass())
            }
        }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.button.widthAnchor.constraint(equalToConstant: 240.0),
            self.button.heightAnchor.constraint(equalToConstant: 48.0)
        ])
    }

    @objc func onTapNavigate(_ sender: Any) {
        self.dismiss(animated: true)
    }

    deinit {
        print("SecondVC will be deallocated 🗑")
    }
}

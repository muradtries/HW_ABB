//
//  ViewController.swift
//  MemoryLeakage
//
//  Created by Murad on 24.12.22.
//

import UIKit

class RetainClass {
    var vc: UIViewController?

    init(vc: UIViewController) {
        self.vc = vc
    }
}

class SecondViewController: UIViewController {

    var retainInstances: [RetainClass] = []

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
        self.view.backgroundColor = .white
        self.setupConstraints()

        DispatchQueue.global().async {
            for _ in 0...100_000 {
                self.retainInstances.append(RetainClass(vc: self))
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


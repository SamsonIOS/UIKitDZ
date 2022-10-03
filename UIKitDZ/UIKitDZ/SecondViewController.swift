//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by coder on 02.10.2022.
//

import UIKit
/// Второй экран для таб бара
final class SecondViewController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
    }
    
    // MARK: Private Methods
    private func setViewController() {
        title = "Второй экран"
        view.backgroundColor = .green
    }
}

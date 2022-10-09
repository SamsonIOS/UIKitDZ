//
//  SecondViewController.swift
//  UIKitDZ
//
//  Created by coder on 08.10.2022.
//

import UIKit

/// Второй экран c будущими элементами
final class SecondViewController: UIViewController {

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
    }
    
    // MARK: Private Methods
    private func setViewControllers() {
        view.backgroundColor = .green
    }
}

//
//  StacksViewController.swift
//  UIKitDZ
//
//  Created by coder on 16.10.2022.
//

import UIKit

// Экран со StackView
final class StacksViewController: UIViewController {

    // MARK: Visual Components
    private enum ViewMetrics {
        static let spacing: CGFloat = 10.0
    }
    
    // MARK: Private Properties
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private var yellowView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = ViewMetrics.spacing
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: Private Methods
    private func setView() {
        view.addSubview(blackView)
        blackView.addSubview(rootStackView)
        setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: rootStackView.topAnchor, constant: -7),
            blackView.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor, constant: 7),
            blackView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor, constant: -7),
            blackView.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            rootStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rootStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rootStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.67),
            rootStackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
    }

}

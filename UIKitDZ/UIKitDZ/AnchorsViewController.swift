//
//  AnchorsViewController.swift
//  UIKitDZ
//
//  Created by coder on 16.10.2022.
//

import UIKit

/// Экран с NSLayoutAnchor
final class AnchorsViewController: UIViewController {

    // MARK: Private properties
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var yellowView: UIView = {
        var view = UIView()
        view.backgroundColor = .systemYellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    // MARK: Private Methods
    private func setView() {
        view.backgroundColor = .white
        view.addSubview(blackView)
        blackView.addSubview(yellowView)
        blackView.addSubview(redView)
        blackView.addSubview(greenView)
        anchorsForYellowView()
        anchorsForRedView()
        anchorsForGreenView()
        anchorsForBlackView()
    }
    
    func anchorsForBlackView() {
        blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -10).isActive = true
        blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10).isActive = true
        blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10).isActive = true
        blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10).isActive = true
    }
    
    func anchorsForYellowView() {
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
    }
    
   func anchorsForRedView() {
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        redView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor)
                    .constraint(equalTo: yellowView.heightAnchor, multiplier: 1.1).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }

    func anchorsForGreenView() {
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        greenView.centerYAnchor.anchorWithOffset(to: yellowView.centerYAnchor)
            .constraint(equalTo: yellowView.heightAnchor, multiplier: -1.1).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }
}

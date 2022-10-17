//
//  LayoutViewController.swift
//  UIKitDZ
//
//  Created by coder on 16.10.2022.
//

import UIKit

/// Экран с NSLayoutConstraint
final class LayoutViewController: UIViewController {
    
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
        constraintsBlackView()
        constraintsRedView()
        constraintsYellowView()
        constraintsGreenView()
    }
    
    private func constraintsBlackView() {
        NSLayoutConstraint(
            item: blackView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .leading,
            multiplier: 1,
            constant: -10).isActive = true

        NSLayoutConstraint(
            item: blackView,
            attribute: .top,
            relatedBy: .equal,
            toItem: redView,
            attribute: .top,
            multiplier: 1,
            constant: -10).isActive = true

        NSLayoutConstraint(
            item: blackView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .trailing,
            multiplier: 1,
            constant: 10).isActive = true

        NSLayoutConstraint(
            item: blackView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: greenView,
            attribute: .bottom,
            multiplier: 1,
            constant: 10).isActive = true
    }

    private func constraintsRedView() {
            NSLayoutConstraint(
                item: redView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .centerX,
                multiplier: 1,
                constant: 0).isActive = true

            NSLayoutConstraint(
                item: redView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .top,
                multiplier: 1,
                constant: -10).isActive = true

            NSLayoutConstraint(
                item: redView,
                attribute: .width,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .width,
                multiplier: 1,
                constant: 0).isActive = true

            NSLayoutConstraint(
            item: redView,
            attribute: .height,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .height,
            multiplier: 1,
            constant: 0).isActive = true
    }
    
    private func constraintsYellowView() {
            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0).isActive = true
            
            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0).isActive = true
            
            NSLayoutConstraint(
                item: yellowView,
                attribute: .width,
                relatedBy: .equal,
                toItem: view,
                attribute: .height,
                multiplier: 0.2,
                constant: 0).isActive = true
            
            NSLayoutConstraint(
            item: yellowView,
            attribute: .height,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .width,
            multiplier: 1,
            constant: 0).isActive = true
    }
    
    private func constraintsGreenView() {
            NSLayoutConstraint(
                item: greenView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .centerX,
                multiplier: 1,
                constant: 0).isActive = true

            NSLayoutConstraint(
                item: greenView,
                attribute: .top,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .bottom,
                multiplier: 1,
                constant: 10).isActive = true

            NSLayoutConstraint(
                item: greenView,
                attribute: .width,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .width,
                multiplier: 1,
                constant: 0).isActive = true

            NSLayoutConstraint(
            item: greenView,
            attribute: .height,
            relatedBy: .equal,
            toItem: yellowView,
            attribute: .height,
            multiplier: 1,
            constant: 0).isActive = true
    }
}

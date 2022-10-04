//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Начальний VC
class ViewController: UIViewController {
    
    private lazy var textOnViewController: UITextView = {
        var textView = UITextView(frame: CGRect(
            x: 0,
            y: 50,
            width: self.view.bounds.width,
            height: 700))
        textView.text = book.text
        textView.contentInset = UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 10)
        textView.isEditable = false
        textView.textAlignment = .justified
        return textView
    }()
    
    private lazy var textSlider: UISlider = {
        var slider = UISlider(frame: CGRect(
            x: 0,
            y: 750,
            width: 250,
            height: 50))
        slider.center.x = view.center.x
        slider.minimumValue = 5
        slider.maximumValue = 40
        slider.value = 10
        slider.addTarget(self, action: #selector(textSliderAction), for: .valueChanged)
        return slider
    }()
    
    private lazy var fontSegmentControl: UISegmentedControl = {
        let items = ["a", "A"]
        var segment = UISegmentedControl(items: items)
        segment.frame = CGRect(
            x: 20,
            y: 780,
            width: 70,
            height: 50)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(changeFontAction), for: .valueChanged)
        return segment
    }()
    
    var currentFont = "GothicNeo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewController()
    }
    
    func setViewController() {
        view.addSubview(textOnViewController)
        view.addSubview(textSlider)
        view.addSubview(fontSegmentControl)
    }
    
    @objc private func textSliderAction() {
        textOnViewController.font = textOnViewController.font?.withSize(CGFloat(textSlider.value))
    }
    
    @objc private func changeFontAction() {
        if fontSegmentControl.selectedSegmentIndex == 0 {
            
        }
    }
}

//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Экран с таймером
class TimerViewController: UIViewController {
    
    // MARK: IBOutlet
    @IBOutlet weak var timerPickerView: UIPickerView!
    @IBOutlet weak var signalForTimerButton: UIButton!
    
    // MARK: Public properties
    let hours = Array(0...23)
    let minutes = Array(0...59)
    let seconds = Array(0...59)
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setPicker()
    }
    // MARK: Public Methods
    func setPicker() {
        timerPickerView.delegate = self
        timerPickerView.dataSource = self
        signalForTimerButton.layer.cornerRadius = 10
    }
}

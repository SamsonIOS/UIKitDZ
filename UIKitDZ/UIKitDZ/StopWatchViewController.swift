//
//  ViewController.swift
//  UIKitDZ
//
//  Created by coder on 21.09.2022.
//

import UIKit
/// Экран с таймером
final class StopWatchViewController: UIViewController {
    
    // MARK: @IBOutlet properties
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: Private Methods
    private func setUI() {
        
        resetButton.isEnabled = false
        startButton.isEnabled = true
        
        timerLabel.layer.cornerRadius = 9
        timerLabel.layer.masksToBounds = true
        
        resetButton.layer.cornerRadius = resetButton.bounds.width / 2
        resetButton.isEnabled = false
        
        startButton.layer.cornerRadius = startButton.bounds.width / 2
    }
    
    // MARK: @IBAction private func
    @IBAction private func resetButtonAction(_ sender: UIButton) {
        
        Properties.timer?.invalidate()
        Properties.isTimeRunning = false
        Properties.counter = 0.0
        
        timerLabel.text = "00:00:00.0"
        resetButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    @IBAction private func startButtonAction(_ sender: UIButton) {
        
        if Properties.isTimeRunning == false {
            Properties.timer = Timer.scheduledTimer(
                timeInterval: 0.1,
                target: self,
                selector: #selector(runTimer),
                userInfo: nil,
                repeats: true)
            
            sender.setTitle("Стоп", for: .normal)
            Properties.isTimeRunning = true
            
        } else if Properties.isTimeRunning == true {
            sender.setTitle("Cтарт", for: .normal)
            resetButton.isEnabled = true
            startButton.isEnabled = true
            
            Properties.isTimeRunning = false
            Properties.timer?.invalidate()
            
        }
    }
    
    @objc private func runTimer() {
        
        Properties.counter += 0.1
        // hh:mm:ss
        let flooredCounter = Int(floor(Properties.counter))
        let hour = flooredCounter / 3600
        
        let minutes = (flooredCounter % 3600) / 60
        var minutesString = "\(minutes)"
        if minutes < 10 {
            minutesString = "0\(minutes)"
        }
        
        let seconds = (flooredCounter % 360) % 60
        var secondString = "\(seconds)"
        if seconds < 10 {
            secondString = "0\(seconds)"
        }
        
        let deciseconds = String(format: "%.1f", Properties.counter).components(separatedBy: ".").last ?? "0"
        
        timerLabel.text = "\(hour):\(minutesString):\(secondString).\(String(describing: deciseconds))"
    }
}

// MARK: Extension - StopWatchViewController, Properties
private extension StopWatchViewController {
    enum Properties {
        static var timer: Timer?
        static var isTimeRunning = false
        static var counter = 0.0
    }
}

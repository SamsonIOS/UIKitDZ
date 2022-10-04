//
//  Extention+pickerView.swift
//  UIKitDZ
//
//  Created by coder on 03.10.2022.
//

import UIKit
// MARK: UIPickerViewDelegate, UIPickerViewDataSource
extension TimerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return hours.count
        case 1:
            return minutes.count
        case 2:
            return seconds.count
        default:
            return 0
        }
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        attributedTitleForRow row: Int,
        forComponent component: Int) -> NSAttributedString? {
            
        var timeForElements = ""
            
        switch component {
        case 0:
            timeForElements = "\(hours[row]) h"
        case 1:
            timeForElements = "\(minutes[row]) min"
        case 2:
            timeForElements = "\(seconds[row]) s"
        default:
            break
        }
            
        let attributedString = NSAttributedString(
            string: timeForElements,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            return attributedString
    }
}

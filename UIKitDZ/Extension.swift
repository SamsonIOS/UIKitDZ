//
//  Extension.swift
//  UIKitDZ
//
//  Created by coder on 02.10.2022.
//

import Foundation
import UIKit
/// Делаем расширение для пикеров цвета и колличества строк в лэйбле
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return valuesNumberLinePicker.count
        case 1:
            return valuesColorPicker.count
        default:
             return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return String(valuesNumberLinePicker[row])
        case 1:
            return valuesColorPicker[row].0
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            someTextInLabel.numberOfLines = valuesNumberLinePicker[row]
        case 1:
            someTextInLabel.textColor = valuesColorPicker[row].1
        default:
            break
        }
    }
}

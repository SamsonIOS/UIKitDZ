//
//  Extension.swift
//  UIKitDZ
//
//  Created by coder on 27.09.2022.
//

import Foundation
import UIKit
/// UIPickerViewDelegate, UIPickerViewDataSource
extension CarsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return caseInPickerView.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return caseInPickerView[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch caseInPickerView[row] {
        case "Поделится":
            present(activityView, animated: true, completion: nil)
        case "Машины":
            print(caseInPickerView[row])
        case "Мотоциклы":
            print(caseInPickerView[row])
        default:
            break
        }
    }
}

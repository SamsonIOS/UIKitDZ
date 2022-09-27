//
//  Extension.swift
//  UIKitDZ
//
//  Created by coder on 27.09.2022.
//

import Foundation
import UIKit
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return someArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return someArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch someArray[row] {
        case "Поделится":
            present(activity, animated: true, completion: nil)
        case "Машины":
            print(someArray[row])
        case "Мотоциклы":
            print(someArray[row])
        default:
            break
        }
    }
}

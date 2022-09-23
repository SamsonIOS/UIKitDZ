//
//  ViewControllerSecondSubClass.swift
//  UIKitDZ
//
//  Created by coder on 22.09.2022.
//

import UIKit
/// Second View Controller - Information about order
class ViewControllerSecondSubClass: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var numbersOfGuest: UITextField!
    
    @IBOutlet weak var numberOfTable: UITextField!
    
    @IBOutlet weak var billButton: UIButton!
    
    @IBOutlet weak var vipRoomSwitch: UISwitch!
    
    @IBOutlet weak var paySwitch: UISwitch!
    
    @IBOutlet weak var tableSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSwitches()
        billButton.layer.cornerRadius = 17
        buttonBack()
    }
    func buttonBack() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "❮ Назад",
            style: .plain,
            target: self,
            action: #selector(dismissSelf))
        let tabBar = navigationItem.leftBarButtonItem
        tabBar?.tintColor = .blue
    }
    @objc func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
    func createSwitches() {
        tableSwitch.isOn = true
        paySwitch.isOn = false
        vipRoomSwitch.isOn = false
    }
    @IBAction func actionBillButton(_ sender: UIButton) {
        let alertBillButton = UIAlertController(
            title: .none,
            message: "Выставить счет?",
            preferredStyle: .alert)
        let actionBillButtonCancel = UIAlertAction(
            title: "Cancel",
            style: .cancel) { _ in
        }
        let actionBillCheck = UIAlertAction(
            title: "Чек",
            style: .default) { _ in
            let storyboard = UIStoryboard(
                name: "Main",
                bundle: nil)
            guard let newVC = storyboard.instantiateViewController(
                withIdentifier: "vc3"
            ) as? ViewControllerThreed else { return }
            self.present(newVC, animated: true)
        }
    alertBillButton.addAction(actionBillButtonCancel)
    alertBillButton.addAction(actionBillCheck)
    present(alertBillButton, animated: true)
        }
}

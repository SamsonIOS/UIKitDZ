//
//  ViewControllerThreed.swift
//  UIKitDZ
//
//  Created by coder on 22.09.2022.
//

import UIKit
/// Threed View Controller - Экран с счетом за блюда
class ViewControllerThreed: UIViewController {

    @IBOutlet weak var priceForAll: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        priceForAll.layer.cornerRadius = 17
    }
}

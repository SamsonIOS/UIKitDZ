//
//  ViewControllerThreed.swift
//  UIKitDZ
//
//  Created by coder on 22.09.2022.
//

import UIKit
/// ViewControllerThreed - Экран с счетом за блюда
class ViewControllerThreed: UIViewController {

    @IBOutlet weak var priceForAll: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        priceForAll.layer.cornerRadius = 17
    }
}

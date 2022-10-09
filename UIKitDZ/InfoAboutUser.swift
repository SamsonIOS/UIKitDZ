//
//  InfoAboutUser.swift
//  UIKitDZ
//
//  Created by coder on 07.10.2022.
//

import Foundation

/// Даннные пользователей
final class InfoUser {
    var userDataMap: [String: String] = UserDefaults.standard.object(forKey: "userData") as? [String: String] ?? [:]
    
    static var info = InfoUser()
    
    private init() {
        
    }
}

//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 7/23/24.
//

import Foundation

public extension AppearanceSettings {
    static var appearance: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: appearanceKey)
            // HammelContentType.updateTypesImagesColor()
        }
        get { return UserDefaults.standard.integer(forKey: appearanceKey) }
    }
    
    static var isAutoChangeAppearance: Bool {
        set { UserDefaults.standard.set(newValue, forKey: isAutoChangeAppearanceKey) }
        get { return UserDefaults.standard.bool(forKey: isAutoChangeAppearanceKey) }
    }
}


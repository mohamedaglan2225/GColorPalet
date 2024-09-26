//
//  AppSettings.swift
//
//
//  Created by Khalid on 21/05/2024.
//

import Foundation
import UIKit

public class AppearanceSettings {
    
    public static var appearanceKey = "appearance"
    public static var isAutoChangeAppearanceKey = "AutoChangeAppearance"
    
    fileprivate static var isNight: Bool {
        let calendar = Calendar.current
        let now = Date()
        let F = calendar.date(bySettingHour: 20, minute: 0, second: 0, of: now) ?? now
        let T = calendar.date(bySettingHour: 6, minute: 0, second: 0, of: now) ?? now
        return now > F || T > now
    }
    
    public static func AutoChangeAppearance() {
        if isAutoChangeAppearance {
            AppearanceSettings.appearance = AppearanceSettings.isNight ? 1 : 0
        }
    }
    
}

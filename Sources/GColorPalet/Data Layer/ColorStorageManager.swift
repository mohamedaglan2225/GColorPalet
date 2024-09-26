//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/23/24.
//

import Foundation
import UIKit

public class ColorStorageManager: ColorStorageManagerProtocol {
    
    private static let colorPacksKey = "ColorPacksKey"
    
    public func getColorPacks() -> [[UIColor]] {
        if let data = UserDefaults.standard.data(forKey: ColorStorageManager.colorPacksKey),
           let colorPacks = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [[UIColor]] {
            return colorPacks
        }
        return ColorUseCase.defaultColorPacks()
    }

    public func saveColorPacks(_ colors: [[UIColor]]) {
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: colors, requiringSecureCoding: false) {
            UserDefaults.standard.set(data, forKey: ColorStorageManager.colorPacksKey)
        }
    }

    public func isFirstTimeSettingColors() -> Bool {
        return UserDefaults.standard.bool(forKey: "isSetColors")
    }
    
    public func setFirstTimeSettingColors(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: "isSetColors")
    }
}


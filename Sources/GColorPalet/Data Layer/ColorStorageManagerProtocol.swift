//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/23/24.
//

import UIKit

public protocol ColorStorageManagerProtocol {
    func getColorPacks() -> [[UIColor]]
    func saveColorPacks(_ colors: [[UIColor]])
    func isFirstTimeSettingColors() -> Bool
    func setFirstTimeSettingColors(_ value: Bool)
}

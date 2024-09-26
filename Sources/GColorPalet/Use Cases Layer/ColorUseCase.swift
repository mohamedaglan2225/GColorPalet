//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/23/24.
//

import UIKit

public class ColorUseCase: ColorUseCaseProtocol {
    private let storageManager: ColorStorageManagerProtocol
    
    public init(storageManager: ColorStorageManagerProtocol) {
        self.storageManager = storageManager
    }

    public func createDefaultColorsIfNeeded() {
        if !storageManager.isFirstTimeSettingColors() {
            let defaultColors = ColorUseCase.defaultColorPacks()
            storageManager.saveColorPacks(defaultColors)
            storageManager.setFirstTimeSettingColors(true)
        }
    }

    public func getSelectedColorPack(appearance: Int) -> [UIColor] {
        return storageManager.getColorPacks()[appearance]
    }

    public static func defaultColorPacks() -> [[UIColor]] {
        return [
            [UIColor(rgb: 0x66B0AF), UIColor.white, UIColor.white, UIColor.black, UIColor(rgb: 0x66B0AF)],
            [UIColor(rgb: 0x060606), UIColor.white, UIColor.black, UIColor.white, UIColor.gray],
            [UIColor(rgb: 0x75527A), UIColor.white, UIColor.white, UIColor.black, UIColor(rgb: 0x75527A)],
            [UIColor(rgb: 0xB67E3E), UIColor.white, UIColor(rgb: 0x1B1B1B), UIColor.white, UIColor(rgb: 0x959595)]
        ]
    }
}

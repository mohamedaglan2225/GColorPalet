//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/23/24.
//

import UIKit

public protocol ColorUseCaseProtocol {
    func createDefaultColorsIfNeeded()
    func getSelectedColorPack(appearance: Int) -> [UIColor]
}

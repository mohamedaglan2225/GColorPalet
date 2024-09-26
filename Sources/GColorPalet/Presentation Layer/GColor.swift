//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/23/24.
//

import UIKit

public class GColor {
    
    public static let shared = GColor(colorUseCase: ColorUseCase(storageManager: ColorStorageManager()))
    
    private let colorUseCase: ColorUseCaseProtocol
    
    public init(colorUseCase: ColorUseCaseProtocol) {
        self.colorUseCase = colorUseCase
    }
    
    private var selectedColorsPack: [UIColor] {
        return colorUseCase.getSelectedColorPack(appearance: AppearanceSettings.appearance)
    }
    
    // Base Colors
    public var baseThame: UIColor               { return selectedColorsPack[0].check(by: 8) }
    public var baseThameText: UIColor           { return selectedColorsPack[1].check(by: 8) }
    public var baseButtonBackground: UIColor    { return baseView.isDark ? baseView.lighter(by: 8) : baseView }
    public var baseButton: UIColor              { return selectedColorsPack[4] }
    public var baseView: UIColor                { return selectedColorsPack[2] }
    public var baseViewText: UIColor            { return selectedColorsPack[3].check(by: 20) }
    public var baseTableView: UIColor           { return baseView.check(by: 5.5) }
    public var baseTabBar: UIColor              { return baseView.check(by: 3) }
    public var baseTabBarText: UIColor          { return baseButton.lighter(by: 8) }
    
    // Exposed Color Properties
    public var navBar: UIColor { return baseThame }
    public var navBarText: UIColor { return baseThameText }
    public var tabBar: UIColor { return baseTabBar }
    public var tabBarText: UIColor { return baseTabBar.isDark ? baseTabBarText.lighter() : baseTabBarText.darker(by: 10) }
    public var viewText: UIColor { return baseViewText }
    public var viewBackground: UIColor { return baseView.check(by: 2) }
    public var main: UIColor { return baseButton }

    public var tableView: UIColor { return baseTableView }
    public var tableViewText: UIColor { return selectedColorsPack[3].check(by: 30) }
    public var tableViewButtonText: UIColor              { return tableViewButtonBackground.textColor(by: 60) }
    public var tableViewButtonBackground: UIColor        { return baseView.check(by: 12) }
    public var tableViewCellHeader: UIColor              { return baseButtonBackground.check(by: 5) }
    public var tableViewCellHeaderText: UIColor          { return tableViewCellHeader.check(by: 15) }
    public var tableViewCell: UIColor                    { return baseButtonBackground }
    public var tableViewCellHighlighted: UIColor         { return tableViewCell.isBDark ? tableViewCell.lighter(by: 8) : tableViewCell.darker(by: 3) }
    public var tableViewCellSelected: UIColor            { return tableViewText.alpha(0.1) }
    public var tableViewCellText: UIColor                { return selectedColorsPack[3].check(by: 15) }
    public var tableViewCellTextDanger: UIColor          { return tableViewCell.isDark ? selectedColorsPack[3].check(by: 10) : UIColor(rgb: 0xD01118) }
    public var tableViewCellContent: UIColor             { return baseButton } // buttons and images colored
    public var tableViewCellContentCarPlay: UIColor      { return UIColor(rgb: 0x66B1D6) }
    public var tableViewCellProgressBackground: UIColor  { return baseButton.alpha(0.1) }
    
    
    
    public var textField: UIColor { return baseButtonBackground.check(by: 2) }
    public var textFieldText: UIColor { return baseViewText.check(by: 15) }
    public var textFieldPlaceholderText: UIColor { return baseViewText.alpha(0.5) }

    public var ativityIndicatorView: UIColor { return baseButton.alpha(0.5) }
    public var null: UIColor { return UIColor(white: 0, alpha: 0) }
    
    public var statusBarNav: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return selectedColorsPack[1].isDark ? .darkContent : .lightContent
        } else {
            return selectedColorsPack[1].isDark ? .default : .lightContent
        }
    }

    public var AdColors: [UIColor] {
        let AdBackground = baseView.check(by: 8)
        let AdTitle = selectedColorsPack[3].check(by: 10)
        let AdDescription = AdTitle.alpha(0.8)
        let AdButton = baseThame
        let AdButtonText = selectedColorsPack[1].check(by: 0)
        return [AdBackground, AdTitle, AdDescription, AdButton, AdButtonText]
    }
}


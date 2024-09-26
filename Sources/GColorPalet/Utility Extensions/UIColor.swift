//
//  File.swift
//  
//
//  Created by Mohamed Aglan on 9/23/24.
//

import UIKit

public extension UIColor {
    
    func isClose(to color: UIColor, by percentage: CGFloat = 50.0) -> Bool {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        self.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        let dR = abs(r1 - r2)
        let dG = abs(g1 - g2)
        let dB = abs(b1 - b2)
        
        return (dR * 100) < percentage && (dG * 100) < percentage && (dB * 100) < percentage
    }
    
    var isBDark: Bool {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        return brightness < 0.7
    }
    
    var isDark: Bool {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        return brightness < 0.3
    }
    
    func check(by percentage: CGFloat = 30.0) -> UIColor {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        return brightness < 0.5 ? self.lighter(by: percentage) : self.darker(by: percentage)
    }
    
    func lighter(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: abs(percentage))
    }
    
    func darker(by percentage: CGFloat = 30.0) -> UIColor {
        return self.adjustBrightness(by: -abs(percentage))
    }
    
    func alpha(_ value: CGFloat) -> UIColor {
        return self.withAlphaComponent(value)
    }
    
    func adjustBrightness(by percentage: CGFloat) -> UIColor {
        var H: CGFloat = 0, S: CGFloat = 0, B: CGFloat = 0, A: CGFloat = 0
        if getHue(&H, saturation: &S, brightness: &B, alpha: &A) {
            B += (percentage/100)
            B = max(min(B, 1.0), 0.0)
            return UIColor(hue: H, saturation: S, brightness: B, alpha: A)
        }
        return self
    }

    convenience init(rgb: Int, alpha: CGFloat = 1) {
        self.init(
            red: (CGFloat((rgb >> 16) & 0xFF)) / 255.0,
            green: (CGFloat((rgb >> 8) & 0xFF)) / 255.0,
            blue: (CGFloat(rgb & 0xFF)) / 255.0,
            alpha: alpha
        )
    }
    
    func textColor(by percentage: CGFloat = 30.0) -> UIColor {

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        var brightness: CGFloat = 0.0

        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        // algorithm from: http://www.w3.org/WAI/ER/WD-AERT/#color-contrast
        brightness = ((r * 299) + (g * 587) + (b * 114)) / 1000;
        if (brightness < 0.9) {
            return UIColor.white.darker(by: percentage)
        }
        else {
            return UIColor.black.lighter(by: percentage)
        }
    }
}

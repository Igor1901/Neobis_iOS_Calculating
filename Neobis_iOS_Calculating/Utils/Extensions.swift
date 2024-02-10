//
//  Extensions.swift
//  Neobis_iOS_Calculating
//
//  Created by Игорь Пачкин on 10/2/24.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    static func trueOrange() -> UIColor{
        return UIColor.rgb(red: 255, green: 158, blue: 11)
    }
    static func trueLightGray() -> UIColor {
        return UIColor.rgb(red: 163, green: 164, blue: 165)
    }
    static func trueGray() -> UIColor {
        return UIColor.rgb(red: 51, green: 51, blue: 51)
    }
}

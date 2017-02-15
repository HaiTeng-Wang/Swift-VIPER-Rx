//
//  UIColor.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 2/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation

internal extension UIColor {
    static func HexRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    var backGroudColor_grad: UIColor {
        return UIColor.HexRGB(rgbValue: 0xf5f5f5)
    }
}

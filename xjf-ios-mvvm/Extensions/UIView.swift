//
//  UIView.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 2/14/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation

internal extension UIView {

    var viewController: UIViewController? {
        var responder: UIResponder? = self
        while responder != nil {
            if let responder = responder as? UIViewController {
                return responder
            }
            responder = responder?.next
        }
        return nil
    }

}

//
//  UIViewController+Extra.swift
//  xjf-ios-mvvm
//
//  Created by 郑先生 on 2017/2/15.
//  Copyright © 2017年 xijinfa. All rights reserved.
//

import Foundation

internal extension UIViewController {

    var topNavigationController: UINavigationController? {
        var topView: UIView = self.view
        while topView.viewController != nil {
            if let navigationController = topView.viewController!.navigationController {
                return navigationController
            }
            if let superview = topView.superview {
                topView = superview
            } else {
                break
            }
        }
        return nil
    }
}

//
//  MainRouter.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 2/15/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation

class MainRouter {

    static func jumpByType(naviVC: UINavigationController?, link: String?) {
        if let navi = naviVC {
            if let jumpUrl = link {
                let isValidUrl = StringHelper.verifyUrl(urlString: jumpUrl)
                if isValidUrl {
                    Logger.logInfo(message: "is valid url: \(isValidUrl)")
                        navi.pushViewController(WebViewController(url: link!, shareEnable: false), animated: true)
                }
            }
        }
    }

}

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
        guard let naviVC = naviVC, let link = link else {
            return
        }
        let isValidUrl = StringHelper.verifyUrl(urlString: link)
        if isValidUrl {
            Logger.logInfo(message: "is valid url: \(isValidUrl)")
            naviVC.pushViewController(WebViewController(url: link, shareEnable: false), animated: true)
        }
    }

}

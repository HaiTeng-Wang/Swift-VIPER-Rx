//
//  String.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 2/15/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation

class StringHelper {

    static func verifyUrl(urlString: String?) -> Bool {
        //Check for nil
        if let urlString = urlString {
            // create NSURL instance
            if let url = URL(string: urlString) {
                // check if your application can open the NSURL instance
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return false
    }

}

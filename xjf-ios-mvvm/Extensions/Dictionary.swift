//
//  Dictionary.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 2/3/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import Swift

internal extension Dictionary {
    mutating func update(other: Dictionary) {
        for (key, value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}

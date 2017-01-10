//
//  CacheManager.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/10/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RxSwift
import AwesomeCache

class CacheManager {

    static let CACHE = "xijinfa_cache"
    static let STALES = 60 as TimeInterval

    public static func readDataFromCache(key: String)->Observable<NSString> {
        return Observable.create { subscribe in
            print("readDataFromCache :)")
            do {
                let cache = try Cache<NSString>(name: CACHE)
                if let data = cache[key] as? String {
                    let nData = data as NSString
                    subscribe.on(.next(nData))
                    subscribe.on(.completed)
                } else {
                    subscribe.on(.next(""))
                    subscribe.on(.completed)
                }
            } catch _ {
                print("Something went wrong :(")
            }
            return Disposables.create()
        }
    }

    public static func writeDataToDisk(key: String, data: NSString)->Observable<NSString> {
        return Observable.create { subscribe in
            do {
                let cache = try Cache<NSString>(name: CACHE)
                cache.setObject(data, forKey: key, expires: .seconds(STALES))
                subscribe.on(.next(data))
                subscribe.on(.completed)
            } catch _ {
                print("Something went wrong :(")
            }

            return Disposables.create()
        }
    }
}

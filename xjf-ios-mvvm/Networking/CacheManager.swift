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
    static let STALES = 10 as TimeInterval

    static let CACHE_WEEKLY = "xijinfa_cache_weekyly"
    static let STALES_WEEKLY = 60*60*24*7 as TimeInterval

    public static func readDataFromCache(key: String)->Observable<NSString> {
        return Observable.create { subscribe in
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
                Logger.logError(message: "Cache error")
            }
            return Disposables.create()
        }
    }

    public static func writeDataToDisk(key: String, data: NSString)->Observable<NSString> {
        return Observable.create { subscribe in
            writeCache(cacheName: CACHE, interval: STALES, key:key, data:data)
            subscribe.on(.next(data))
            subscribe.on(.completed)
            return Disposables.create()
        }
    }

    public static func clearCache()->Observable<NSString> {
        return Observable.create { subscribe in
            do {
                let cache = try Cache<NSString>(name: CACHE)
                cache.removeAllObjects()
                subscribe.on(.next(""))
                subscribe.on(.completed)
            } catch _ {
                Logger.logError(message: "Cache error")
            }

            return Disposables.create()
        }
    }

    public static func readDataFromWeeklyCache(key: String) -> Observable<NSString> {
        return Observable.create { observer in
            do {
                let cache = try Cache<NSString>(name: CACHE_WEEKLY)
                if let data = cache[key] as? String {
                    let nData = data as NSString
                    observer.on(.next(nData))
                } else {
                    observer.on(.next("{\"errCode\":404,\"errMsg\":\"Not Found.\"}"))
                }
                observer.on(.completed)
            } catch _ {
                Logger.logError(message: "Cache error")
            }

            return Disposables.create()
        }
    }

    public static func writeDataToWeeklyDisk(key: String, data: NSString)->Observable<NSString> {
        return Observable.create { subscribe in
            writeCache(cacheName: CACHE_WEEKLY, interval: STALES_WEEKLY, key:key, data:data)
            subscribe.on(.next(data))
            subscribe.on(.completed)
            return Disposables.create()
        }
    }

    public static func writeCache(cacheName: String, interval: TimeInterval, key: String, data: NSString) {
        do {
            let cache = try Cache<NSString>(name: cacheName)
            cache.setObject(data, forKey: key, expires: .seconds(STALES_WEEKLY))
        } catch _ {
            Logger.logError(message: "Cache error")
        }

    }

    public static func clearCacheWeekly()->Observable<NSString> {
        return Observable.create { subscribe in
            do {
                let cache = try Cache<NSString>(name: CACHE_WEEKLY)
                cache.removeAllObjects()
                subscribe.on(.next(""))
                subscribe.on(.completed)
            } catch _ {
                Logger.logError(message: "Cache error")
            }

            return Disposables.create()
        }
    }
}

//
//  DataManager.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/9/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import AwesomeCache
import ObjectMapper
import Moya_ObjectMapper

class DataManager {

    public static func getBanner(path: String) ->Observable<Banner> {
        let banner = XijinfaApi.banner(path:path)
        let key = banner.path
        let netObservable = Network.request(target: banner).writeCache(key: key)

        return Observable.concat([CacheManager.readDataFromCache(key: key), netObservable])
            .takeCacheOrNet()
            .mapObject(Banner.self)
    }

    public static func getSecureCode() ->Observable<Secure> {
        return Network.request(target: .secureCode)
                .mapObject(Secure.self)
    }

    public static func login(userName: String, passwd: String, secureCode: String, secureKey: String) ->Observable<Login> {
        return Network.request(target: .login(userName: userName, passwd: passwd, secureCode: secureCode, secureKey: secureKey))
                .mapObject(Login.self)
    }

}

extension ObservableType where E == NSString {

    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
        return self.flatMap { (string) -> Observable<T> in
            let data = Mapper<T>().map(JSONString: string as String)
            return Observable.just(data!)
        }
    }

    public func takeCacheOrNet() -> Observable<NSString> {
        return self
            .filter({ (string) -> Bool in
                return !string.isEqual(to: "")
            })
            .take(1)
    }

    public func writeCache(key: String) -> Observable<NSString> {
        return self
            .flatMap { data -> Observable<NSString> in
                return CacheManager.writeDataToDisk(key: key, data: data)
            }
            .flatMap { data -> Observable<NSString> in
                return CacheManager.writeDataToWeeklyDisk(key: key, data: data)
            }
            .catchError({ (error) -> Observable<NSString> in
                print("network error: &\(error)")
                return CacheManager.readDataFromWeeklyCache(key: key)
            })
        }
    }

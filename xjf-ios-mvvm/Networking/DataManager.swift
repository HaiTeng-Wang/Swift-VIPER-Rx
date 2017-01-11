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

    public static func getAccessToken() -> String {
        return "accessToken"
    }

    public static func getBanner(path: String) ->Observable<Banner> {
        let banner = XijinfaApi.banner(path:path)
        let key = banner.path
        let netObservable = Network.request(target: banner)
            .flatMap { (nstring) -> Observable<NSString> in
                return CacheManager.writeDataToDisk(key: key, data: nstring)
            }

        return Observable.concat([CacheManager.readDataFromCache(key: key), netObservable])
            .filter({ (string) -> Bool in
                return !string.isEqual(to: "")
            })
            .take(1)
            .flatMap({ (string) -> Observable<Banner> in
                let data = Mapper<Banner>().map(JSONString: string as String)
                return Observable.just(data!)
            })
    }

    public static func getScureCode() ->Observable<Secure> {
        return Network.request(target: .secureCode)
                .flatMap({ (string) -> Observable<Secure> in
                    let data = Mapper<Secure>().map(JSONString: string as String)
                    return Observable.just(data!)
                })
    }

    public static func login(userName: String, passwd: String, secureCode: String, secureKey: String) ->Observable<Login> {
        return Network.request(target: .login(userName: userName, passwd: passwd, secureCode: secureCode, secureKey: secureKey))
                .flatMap({ (string) -> Observable<Login> in
                    let data = Mapper<Login>().map(JSONString: string as String)
                    return Observable.just(data!)
                })
    }

}

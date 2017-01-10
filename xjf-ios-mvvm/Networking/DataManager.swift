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

class DataManager {

    public static func getBanner(path: String) ->Observable<Banner> {
        let banner = XijinfaApi.banner(token:self.getAccessToken(), path:path)
        let key = banner.path
        let netObservable =
            Network.request(target: banner)
                .flatMap { (nstring) -> Observable<NSString> in
                    return CacheManager.writeDataToDisk(key: key, data: nstring)
                }

        return Observable.concat(
            [CacheManager.readDataFromCache(key: key), netObservable])
            .filter({ (string) -> Bool in
                return !string.isEqual(to: "")
            }).take(1)
            .flatMap({ (string) -> Observable<Banner> in
                let banner = Mapper<Banner>().map(JSONString: string as String)
                return Observable.just(banner!)
            })
    }

    public static func getAccessToken() -> String {
        return "accessToken"
    }

}

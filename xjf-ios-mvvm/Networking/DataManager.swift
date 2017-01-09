//
//  DataManager.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/9/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import Carlos
import Moya
import RxSwift

class DataManager {    let disposebag = DisposeBag()

    static let cache = MemoryCacheLevel<String, NSData>().compose(DiskCacheLevel())

    public static func getBanner(path: String) ->Observable<NSData> {

        return Observable.concat(
            [self.getDataFromCache(path: path),
             Network.request(target: .banner(token:self.getAccessToken(), path:"app-home-carousel"))])
    }

    public static func getAccessToken() -> String {
        return "accessToken"
    }

    public static func getDataFromCache(path: String)->Observable<NSData> {
        return Observable.create { subscribe in
            let request = self.cache.get(path)
            request
            .onSuccess { value in
                print("I found \(value)!")
                subscribe.on(.next(value))
                subscribe.on(.completed)
            }
            .onFailure { error in
                print("An error occurred :( \(error)")
                subscribe.on(.error(error))
            }

            return Disposables.create(with: request.cancel)
        }
    }

}

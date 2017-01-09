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

class DataManager {

    static let cache = MemoryCacheLevel<String, NSData>().compose(DiskCacheLevel())

    public static func getBanner(path: String) ->Observable<Response> {
        return Network.request(target: .banner(token:"dasdasda", path:"app-home-carousel"))
        .flatMap { (responce) -> Observable<Response> in
            self.cache.set(responce.data as NSData, forKey: path)
            return Observable.just(responce)
        }.flatMap({ (responce) -> Observable<Response> in
            self.cache.get(path)
                .onSuccess { value in
                    print("I found \(value)!")
                }
                .onFailure { error in
                    print("An error occurred :( \(error)")
            }
            return Observable.just(responce)
        })

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

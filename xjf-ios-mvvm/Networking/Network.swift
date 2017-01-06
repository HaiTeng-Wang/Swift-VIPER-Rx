//
//  Network.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/5/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import Moya
import RxSwift

let endpointClosure = { (target: XijinfaApi) -> Endpoint<XijinfaApi> in
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    return Endpoint(url: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters, parameterEncoding: target.parameterEncoding, httpHeaderFields: target.headers)
}

class Network {
    fileprivate static var provider = RxMoyaProvider<XijinfaApi>(endpointClosure: endpointClosure, plugins: [NetworkLoggerPlugin(verbose: true)])
}

extension Network {
    static func request(target: XijinfaApi) -> Observable<Response> {
        return provider.request(target)
    }
}

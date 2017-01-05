//
//  XijinfaApi.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/5/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import Moya


private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}


private extension String {
    var urlEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

enum XijinfaApi{

    case banner(String)
}

extension XijinfaApi: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://api.rc.xijinfa.com/api/")!
    }
    
    var path: String {
        switch self {
        case .banner(let path):
            return "banner/\(path.urlEscaped)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        return .request
    }
    
    var headers: [String: String]? {
        return ["Authorization": "bearer \(token)","Accept": "application/json"]
    }
    
    var token: String? {
        return nil
    }
    
    public var validate: Bool {
        switch self {
        case .banner:
            return true
        default:
            return false
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .banner(let path):
            return "{\"login\": \"\(path)\", \"id\": 100}".data(using: String.Encoding.utf8)!
        }
    }
    
}


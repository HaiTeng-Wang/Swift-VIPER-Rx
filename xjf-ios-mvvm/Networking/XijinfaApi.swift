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
    static var udid: String {
        return (UIDevice.current.identifierForVendor?.uuidString)!
    }
    static var client: String {
        return UIDevice.current.name
    }
    static var bundleVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
}

enum XijinfaApi {
    case banner(token:String, path:String)
    case secureCode
    case login(userName:String, passwd:String, secureCode:String, secureKey:String)
}

extension XijinfaApi: TargetType {

    var baseURL: URL {
        return URL(string: "https://api.rc.xijinfa.com/api/")!
    }

    var path: String {
        switch self {
        case .banner(_, let path):
            return "banner/\(path.urlEscaped)"
        case .secureCode:
            return "auth/get-secure-code"
        case .login:
            return "auth/login"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        default:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .login(let userName, let passwd, let secureCode, let secureKey):
           return [
                "username": userName,
                "password": passwd,
                "secure_key": secureKey,
                "secure_code": secureCode]
        default:
            return nil
        }
    }

    public var parameterEncoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }

    public var task: Task {
        return .request
    }

    var headers: [String: String]? {
        switch self {
        case .login:
            return ["X-XJF-UDID": String.udid,
                    "X-XJF-PLATFORM": "ios",
                    "X-XJF-VERSION": String.bundleVersion,
                    "X-XJF-CLIENT": String.client,
                    "X-XJF-PUSH-CHANNEL": "xiaomi"]
        default:
            guard let token = token else {
                return ["Accept": "application/json", "Cache-Control": "no-cache"]
            }
            return ["Authorization": "bearer \(token)", "Accept": "application/json", "Cache-Control": "no-cache"]
        }
    }

    var token: String? {
        switch self {
        case .banner(let token, _):
            return token
        default:
            return nil
        }
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
        case .banner(_):
            return stubbedResponse("Banner")
        default:
            return Data()
        }
    }

    func stubbedResponse(_ filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }

}

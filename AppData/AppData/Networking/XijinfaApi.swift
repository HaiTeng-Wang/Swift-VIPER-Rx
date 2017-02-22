//
//  XijinfaApi.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/5/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import Moya

enum XijinfaApi {
    case banner(path:String)
    case course(departmentNumber:Int, courseId:Int, params:Dictionary<String, String>?)
    case courses(departmentNumber:Int, params:Dictionary<String, String>?)
    case secureCode
    case login(userName:String, passwd:String, secureCode:String, secureKey:String)
}

extension XijinfaApi: TargetType {

    var baseURL: URL {
        return URL(string: "https://api.rc.xijinfa.com/api/")!
    }

    var path: String {
        switch self {
        case .banner(let path):
            return "banner/\(path)"
        case .course(let departmentNumber, let courseId, _):
            return "courses\(departmentNumber)/\(courseId)"
        case .courses(let departmentNumber, _):
            return "courses\(departmentNumber)"
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
        case .course(_, _, let params):
            return params
        case .courses(_, let params):
            return params
        default:
            return nil
        }
    }

    var parameterEncoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }

    var task: Task {
        return .request
    }

    var headers: [String: String]? {
        switch self {
        case .login:
            return ["X-XJF-UDID": udid,
                    "X-XJF-PLATFORM": "ios",
                    "X-XJF-VERSION": bundleVersion,
                    "X-XJF-CLIENT": client,
                    "X-XJF-PUSH-CHANNEL": "xiaomi",
                    "Cache-Control": "no-cache",
                    "Accept": "application/json"]
        default:
            guard let token = token else {
                return ["Accept": "application/json"]
            }
            return ["Authorization": "bearer \(token)", "Accept": "application/json"]
        }
    }

    var token: String? {
        return ""
    }

    var validate: Bool {
        switch self {
        case .banner:
            return true
        default:
            return true
        }
    }

    var sampleData: Data {
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

    var udid: String {
        return (UIDevice.current.identifierForVendor?.uuidString)!
    }

    var client: String {
        return UIDevice.current.name
    }

    var bundleVersion: String {
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            return version
        }
        return ""
    }
}

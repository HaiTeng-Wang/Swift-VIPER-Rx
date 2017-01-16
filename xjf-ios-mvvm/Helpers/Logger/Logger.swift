//
//  Logger.swift
//  Localizable
//
//  Created by Ivan Bruel on 23/02/16.
//  Copyright © 2016 Localizable. All rights reserved.
//

import Foundation

class Logger: NSObject {

  fileprivate static let tag = "Localizable"

#if DEBUG
    static var logLevel = LogLevel.Info
#else
    static var logLevel = LogLevel.Warning
#endif

  class func logHttp(message: String) {
    log(message: message, logLevel: .Http)
  }

  class func logError(message: String) {
    log(message: message, logLevel: .Error)
  }

  class func logWarning(message: String) {
    log(message: message, logLevel: .Warning)
  }

  class func logInfo(message: String) {
    log(message: message, logLevel: .Info)
  }

}

fileprivate extension Logger {

  fileprivate class func log(message: String, logLevel: LogLevel) {
    if logLevel.rawValue <= Logger.logLevel.rawValue {
      let messages = message.components(separatedBy: "\n")
      messages.forEach {
        print("[\(tag)][\(logLevel.name)]: \($0)")
      }
    }
  }
}

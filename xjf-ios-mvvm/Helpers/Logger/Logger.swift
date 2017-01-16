//
//  Logger.swift
//  Localizable
//
//  Created by Ivan Bruel on 23/02/16.
//  Copyright © 2016 Localizable. All rights reserved.
//

import Foundation

class Logger: NSObject {

    #if DEBUG
    static var logLevel = LogLevel.Info
    #else
    static var logLevel = LogLevel.Warning
    #endif

    static var dateFormatter: DateFormatter {
        struct Statics {
            static var dateFormatter: DateFormatter = {
                let defaultDateFormatter = DateFormatter()
                defaultDateFormatter.locale = NSLocale.current
                defaultDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
                return defaultDateFormatter
            }()
        }
        return Statics.dateFormatter
    }

    class func logHttp(message: String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        log(message: message, logLevel: .Http, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }

    class func logError(message: String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        log(message: message, logLevel: .Error, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }

    class func logWarning(message: String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        log(message: message, logLevel: .Warning, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }

    class func logInfo(message: String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: Int = #line) {
        log(message: message, logLevel: .Info, functionName: functionName, fileName: fileName, lineNumber: lineNumber)
    }

}

fileprivate extension Logger {

    fileprivate class func log(message: String, logLevel: LogLevel,
                               functionName: StaticString,
                               fileName: StaticString, lineNumber: Int) {
        if logLevel.rawValue <= Logger.logLevel.rawValue {
            let dateStr = dateFormatter.string(from: Date())
            let funcName = String(describing: functionName)
            let filename = (String(describing: fileName) as NSString).lastPathComponent
            let messages = message.components(separatedBy: "\n")
            messages.forEach {
                print("\(dateStr) [\(logLevel.name)] [\(filename):\(lineNumber)] \(funcName) > \($0)")
            }
        }
    }
}

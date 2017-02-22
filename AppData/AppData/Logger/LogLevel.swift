//
//  LogLEvel.swift
//  Localizable
//
//  Created by Ivan Bruel on 23/02/16.
//  Copyright © 2016 Localizable. All rights reserved.
//

import Foundation

public enum LogLevel: Int {

  case None = 0
  case Info = 1
  case Warning = 2
  case Error = 3
  case Http = 4

  var name: String {
    switch self {
    case .None:
      return "None"
    case .Info:
      return "Info"
    case .Warning:
      return "Warning"
    case .Error:
      return "Error"
    case .Http:
      return "HTTP"
    }
  }

}

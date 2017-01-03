//
//  Observable+Result.swift
//
//  Created by Ivan Bruel on 03/05/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import Foundation
import RxSwift
import Result

public extension ObservableType where E: ResultType {

  public func doOnSuccess(onSuccess: (E.Value throws -> Void))
    -> Observable<E> {
      return doOnNext { (value) in
        guard let successValue = value.value else {
          return
        }
        try onSuccess(successValue)
      }
  }

  public func doOnFailure(onFailure: (E.Error throws -> Void))
    -> Observable<E> {
      return doOnNext { (value) in
        guard let failureValue = value.error else {
          return
        }
        try onFailure(failureValue)
      }
  }

  public func subscribeSuccess(success: (E.Value -> Void)) -> Disposable {
    return subscribeNext { value in
      guard let successValue = value.value else {
        return
      }
      success(successValue)
    }
  }

  public func subscribeFailure(failure: (E.Error -> Void)) -> Disposable {
    return subscribeNext { value in
      guard let failureValue = value.error else {
        return
      }
      failure(failureValue)
    }
  }
}

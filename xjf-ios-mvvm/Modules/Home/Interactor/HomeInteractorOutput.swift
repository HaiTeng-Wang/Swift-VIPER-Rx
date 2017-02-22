//
//  HomeHomeInteractorOutput.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RxSwift
import AppData

protocol HomeInteractorOutput: class {
        func receiveBannerData(bannerObservable: Observable<Banner>)
        func receiveWikiData(coursesObservable: Observable<Courses>)
}

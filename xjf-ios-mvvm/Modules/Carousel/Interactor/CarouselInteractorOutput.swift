//
//  CarouselCarouselInteractorOutput.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation
import RxSwift

protocol CarouselInteractorOutput: class {
    func receiveBannerData(bannerData: Observable<Banner>)
}
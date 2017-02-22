//
//  CarouselCarouselInteractor.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import RxSwift
import AppData

class CarouselInteractor: CarouselInteractorInput {

    weak var output: CarouselInteractorOutput!

    func provideBannerData(path: String) {
        self.output.receiveBannerData(bannerData: DataManager.getBanner(path: path))
    }

}

//
//  CarouselCarouselPresenter.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

class CarouselPresenter: CarouselModuleInput, CarouselViewOutput, CarouselInteractorOutput {

    weak var view: CarouselViewInput!
    var interactor: CarouselInteractorInput!
    var router: CarouselRouterInput!

    func viewIsReady() {

    }
}

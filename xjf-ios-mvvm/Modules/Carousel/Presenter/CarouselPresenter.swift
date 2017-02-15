//
//  CarouselCarouselPresenter.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//
import RxSwift

class CarouselPresenter: CarouselModuleInput, CarouselViewOutput, CarouselInteractorOutput {

    weak var view: CarouselViewInput!
    var interactor: CarouselInteractorInput!
    let disposebag = DisposeBag()

    func loadBannerData(path: String) {
        self.interactor.provideBannerData(path: path)
    }

    func receiveBannerData(bannerData: Observable<Banner>) {
        bannerData
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (banner) in
                self.view.setBanner(banner: banner)
            }, onError: { (error) in
                print("onError I found \(error)!")
            }, onCompleted: {
                print("onCompleted")
            }).addDisposableTo(disposebag)
    }
}

//
//  HomeHomePresenter.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import RxSwift

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    var bannerObservable: Observable<Banner>!
    var coursesObservable: Observable<Courses>!
    let disposebag = DisposeBag()

    func viewIsReady() {
        reloadData()
    }

    func reloadData() {
        interactor.provideBannerData(path: "app-home-carousel")
        interactor.provideWikiData(department: 2, categoryId: "54611")

        bannerObservable
            .flatMap {banner -> Observable<Courses> in
                self.view.refreshBanner(banner: banner)
                return self.coursesObservable
            }
            .subscribe(onNext: { (wiki) in
                if let wikiResult = wiki.result {
                    if let wikiData = wikiResult.data {
                        if let wikiItem = wikiData.first {
                            self.view.refreshWiki(course: wikiItem)
                        }
                    }
                }
            }, onError: { (error) in
                self.view.loadDataSuccess()
                print("onError I found \(error)!")
            }, onCompleted: {
                self.view.loadDataSuccess()
                print("onCompleted")
            }).addDisposableTo(disposebag)
    }

    func receiveBannerData(bannerObservable: Observable<Banner>) {
        self.bannerObservable = bannerObservable
    }

    func receiveWikiData(coursesObservable: Observable<Courses>) {
        self.coursesObservable = coursesObservable
    }

}

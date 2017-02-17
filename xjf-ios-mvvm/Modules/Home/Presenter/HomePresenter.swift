//
//  HomeHomePresenter.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import RxSwift

/**
 Presenter: 包含用于准备显示内容（如从Interactor接收的）和用于对用户输入做出反应（通过从Interactor请求新数据）的视图逻辑。
 */
class HomePresenter {

    // V、I、R
    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!

    // data
    var bannerObservable: Observable<Banner>!
    var coursesObservable: Observable<Courses>!

    // disposebag
    let disposebag = DisposeBag()
}


extension HomePresenter: HomeViewOutput {
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
}

extension HomePresenter: HomeInteractorOutput {
    func receiveBannerData(bannerObservable: Observable<Banner>) {
        self.bannerObservable = bannerObservable
    }

    func receiveWikiData(coursesObservable: Observable<Courses>) {
        self.coursesObservable = coursesObservable
    }
}

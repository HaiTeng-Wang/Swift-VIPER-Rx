//
//  HomeHomeInteractor.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

class HomeInteractor: HomeInteractorInput {

    weak var output: HomeInteractorOutput!

    func provideBannerData(path: String) {
        self.output.receiveBannerData(bannerObservable: DataManager.getBanner(path: path))
    }

    func provideWikiData(department: Int, categoryId: String) {
        var params = Dictionary<String, String>()
        params.updateValue(categoryId, forKey:"category_id")
        self.output.receiveWikiData(coursesObservable: DataManager.getCourses(department: department, params: params))
    }

}

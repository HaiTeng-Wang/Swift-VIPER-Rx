//
//  HomeHomeInteractor.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//
import AppData

/**
 Interactor: 包含了操作模型对象（Entities）来执行特定任务的业务逻辑。
 */
class HomeInteractor {
    weak var output: HomeInteractorOutput!
}

extension HomeInteractor: HomeInteractorInput {
    func provideBannerData(path: String) {
        self.output.receiveBannerData(bannerObservable: DataManager.getBanner(path: path))
    }

    func provideWikiData(department: Int, categoryId: String) {
        var params = Dictionary<String, String>()
        params.updateValue(categoryId, forKey:"category_id")
        self.output.receiveWikiData(coursesObservable: DataManager.getCourses(department: department, params: params))
    }
}

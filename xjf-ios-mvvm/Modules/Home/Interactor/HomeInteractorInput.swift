//
//  HomeHomeInteractorInput.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation

protocol HomeInteractorInput {
    func provideBannerData(path: String)
    func provideWikiData(department: Int, categoryId: String)
}

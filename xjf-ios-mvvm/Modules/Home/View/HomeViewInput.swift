//
//  HomeHomeViewInput.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

protocol HomeViewInput: class {

    /**
        @author xijinfa
        Setup initial state of the view
    */

    func setupInitialState()

    func refreshBanner(banner: Banner)

    func refreshWiki(courses: Courses)

    func loadDataSuccess()
}

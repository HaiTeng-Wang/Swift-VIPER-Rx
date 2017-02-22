//
//  CarouselCarouselViewInput.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//
import AppData

protocol CarouselViewInput: class {

    /**
        @author xijinfa
        Setup initial state of the view
    */

    func setupInitialState()

    func setBanner(banner: Banner)
}

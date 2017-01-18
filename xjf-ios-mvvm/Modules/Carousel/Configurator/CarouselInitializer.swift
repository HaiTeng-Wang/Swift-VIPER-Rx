//
//  CarouselCarouselInitializer.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit

class CarouselModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var carouselViewController: CarouselViewController!

    override func awakeFromNib() {

        let configurator = CarouselModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: carouselViewController)
    }

}

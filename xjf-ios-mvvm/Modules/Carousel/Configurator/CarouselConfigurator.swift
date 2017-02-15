//
//  CarouselCarouselConfigurator.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit

class CarouselModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? CarouselViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: CarouselViewController) {

        let presenter = CarouselPresenter()
        presenter.view = viewController

        let interactor = CarouselInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}

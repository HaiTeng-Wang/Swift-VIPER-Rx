//
//  HomeHomeConfigurator.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit

class HomeModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? HomeViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: HomeViewController) {

        let presenter = HomePresenter()
        let router = HomeRouter()
        let interactor = HomeInteractor()

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        interactor.output = presenter
        viewController.output = presenter
    }
}

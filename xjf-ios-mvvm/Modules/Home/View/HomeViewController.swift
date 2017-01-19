//
//  HomeHomeViewController.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, HomeViewInput {

    var output: HomeViewOutput!

    lazy var carsouselView: CarouselViewController = {
        return CarouselViewController(path: "app-dept3-carousel")
    }()

    override func loadView() {
        super.loadView()

        let configurator = CarouselModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: carsouselView)

        view.addSubview(carsouselView.view)

        view.backgroundColor = UIColor.white

        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        carsouselView.view.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(160)
            make.top.equalTo(view).offset(statusBarHeight)
        }
    }

    // MARK: HomeViewInput
    func setupInitialState() {

    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//
//  HomeHomeViewController.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit
import PullToRefresh

class HomeViewController: UIViewController, HomeViewInput {

    var output: HomeViewOutput!

    let refresher = PullToRefresh()

    lazy var carsouselView: CarouselViewController = {
        return CarouselViewController(path: "app-dept3-carousel")
    }()

    lazy var scrollView: UIScrollView = {
        return UIScrollView()
    }()

    override func loadView() {
        super.loadView()

        view.backgroundColor = UIColor.white

        view.addSubview(scrollView)

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let statusBarHeight = UIApplication.shared.statusBarFrame.height

        scrollView.frame = CGRect(x: 0, y: statusBarHeight, width: screenWidth, height: screenHeight)
        scrollView.contentSize = CGSize(width: 0, height: screenHeight + 1)

        let configurator = CarouselModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: carsouselView)

        scrollView.addSubview(carsouselView.view)

        carsouselView.view.snp.makeConstraints { make in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(160)
            make.top.equalTo(scrollView)
        }

        setupPullToRefresh()
        scrollView.endRefreshing(at: Position.top)
    }

    // MARK: HomeViewInput
    func setupInitialState() {

    }
    
    func reloadData() {
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        scrollView.removePullToRefresh(scrollView.topPullToRefresh!)
    }

}

private extension HomeViewController {
    func setupPullToRefresh() {
        scrollView.addPullToRefresh(refresher) { [weak self] in
            print("PullToRefresh")
        }
    }
}

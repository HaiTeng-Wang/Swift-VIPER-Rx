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

        scrollView.addSubview(carsouselView.view)

        carsouselView.view.snp.makeConstraints { make in
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(160)
            make.top.equalTo(scrollView)
        }

        configViews()

        setupPullToRefresh()
        scrollView.endRefreshing(at: Position.top)

        output.viewIsReady()
    }

    func configViews() {
        let homeConfigurator = HomeModuleConfigurator()
        homeConfigurator.configureModuleForViewInput(viewInput: self)

        let carsouselConfigurator = CarouselModuleConfigurator()
        carsouselConfigurator.configureModuleForViewInput(viewInput: carsouselView)
    }

    func setupPullToRefresh() {
        scrollView.addPullToRefresh(refresher) { [weak self] in
            print("PullToRefresh")
            self!.reloadData()
        }
    }

    // MARK: HomeViewInput
    func setupInitialState() {

    }

    func refreshBanner(banner: Banner) {
        Logger.logInfo(message: "refresh banner")
        carsouselView.setBanner(banner: banner)
    }

    func refreshWiki(courses: Courses) {
        Logger.logInfo(message: "refresh wiki")
    }

    func loadDataSuccess() {
        Logger.logInfo(message: "load data success")
        scrollView.endRefreshing(at: Position.top)
    }

    func reloadData() {
        output.reloadData()
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        scrollView.removePullToRefresh(scrollView.topPullToRefresh!)
    }

}

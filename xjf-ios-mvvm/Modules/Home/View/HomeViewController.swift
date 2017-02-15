//
//  HomeHomeViewController.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit
import PullToRefresh

final class HomeViewController: UIViewController {

    // MARK: Properties

    var output: HomeViewOutput!

    private let refresher = PullToRefresh()

    fileprivate lazy var carsouselView: CarouselViewController = {
        return CarouselViewController(path: "app-dept3-carousel")
    }()

    fileprivate lazy var wikiCardView: WikiCardView = {
        return WikiCardView()
    }()

    fileprivate lazy var scrollView: UIScrollView = {
        return UIScrollView()
    }()


    // MARK: Life cycle

    override func loadView() {
        super.loadView()

        view.backgroundColor = UIColor.HexRGB(rgbValue: 0xf5f5f5)

        func addSubviews() {
            view.addSubview(scrollView)
            scrollView.addSubview(carsouselView.view)
            scrollView.addSubview(wikiCardView)
        }

        func configViews() {
            let homeConfigurator = HomeModuleConfigurator()
            homeConfigurator.configureModuleForViewInput(viewInput: self)

            let carsouselConfigurator = CarouselModuleConfigurator()
            carsouselConfigurator.configureModuleForViewInput(viewInput: carsouselView)
        }

        func layoutSubViews() {
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            let statusBarHeight = UIApplication.shared.statusBarFrame.height

            scrollView.frame = CGRect(x: 0, y: statusBarHeight, width: screenWidth, height: screenHeight)
            scrollView.contentSize = CGSize(width: 0, height: screenHeight + 1)

            carsouselView.view.snp.makeConstraints { make in
                make.width.equalTo(scrollView.snp.width)
                make.height.equalTo(160)
                make.top.equalTo(scrollView)
            }

            wikiCardView.snp.makeConstraints { make in
                make.width.equalTo(scrollView.snp.width)
                make.height.equalTo(333)
                make.top.equalTo(carsouselView.view.snp.bottom).offset(10)
            }
        }

        func setupPullToRefresh() {
            scrollView.addPullToRefresh(refresher) { [weak self] in
                print("PullToRefresh")
                func reloadData() {
                    self?.output.reloadData()
                }
                reloadData()
            }
        }

        addSubviews()

        layoutSubViews()

        configViews()

        setupPullToRefresh()

        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        func initNaviBar() {
            if let naviVC = self.navigationController {
                naviVC.setNavigationBarHidden(true, animated: false)
            }
        }
        initNaviBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    deinit {
        if let topPullToRefresh = scrollView.topPullToRefresh {
            scrollView.removePullToRefresh(topPullToRefresh)
        }
    }
}

extension HomeViewController: HomeViewInput {
    func setupInitialState() {

    }

    func refreshBanner(banner: Banner) {
        Logger.logInfo(message: "refresh banner")
        carsouselView.setBanner(banner: banner)
    }

    func refreshWiki(course: CourseData) {
        Logger.logInfo(message: "refresh wiki")
        wikiCardView.setData(courseData: course)
    }

    func loadDataSuccess() {
        Logger.logInfo(message: "load data success")
        scrollView.endRefreshing(at: Position.top)
    }
}


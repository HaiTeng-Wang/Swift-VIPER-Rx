//
//  CarouselCarouselViewController.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class CarouselViewController: UIViewController, CarouselViewInput, iCarouselDataSource, iCarouselDelegate {

    var output: CarouselViewOutput!

    var bannerData: [BannerData]?

    var path: String?

    let disposebag = DisposeBag()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(path: String) {
        self.init(nibName: nil, bundle: nil)
        self.path = path
    }

    private lazy var carsouselView: iCarousel = {
        return iCarousel()
    }()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = carsouselView
        carsouselView.isPagingEnabled = true
        carsouselView.bounces = false
        carsouselView.delegate = self
        carsouselView.dataSource = self
    }

    // MARK: CarouselViewInput
    func setupInitialState() {
    }

    func setBanner(banner: Banner) {
        print("onNext I found errCode \(banner.errCode)!")
        print("onNext I found \(banner.result?.data?[0].title)!")
        self.bannerData = banner.result?.data
        self.carsouselView.reloadData()
    }

    func loadBannerData() {
        output.loadBannerData(path: path ?? "")
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return bannerData?.count ?? 0
    }

    func imageTapped() {
        let position = carsouselView.currentItemIndex
        Logger.logInfo(message: "imageTapped \(bannerData?[position].link)!")
        var params = Dictionary<String, String>()
        params.updateValue("51215", forKey:"category_id")

        self.view.superview?.viewController?.navigationController?.pushViewController(WebViewController(), animated: true)

    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {

        let screenWidth = UIScreen.main.bounds.width

        let tempView = UIView(frame: CGRect(x:0, y:0, width:screenWidth, height:160))

        let frame = CGRect(x:0, y:0, width:screenWidth, height:160)
        let imageView = UIImageView()
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true

        let tap = UITapGestureRecognizer(target: self, action: #selector(CarouselViewController.imageTapped))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true

        if let banners = bannerData {
            if let cover = banners[index].cover {
                if let url = cover[0].url {
                    print("image url: \(url)")
                    imageView.kf.setImage(with: URL(string: url))
                }
            }
        }

        tempView.addSubview(imageView)
        return tempView
    }
}

//
//  CarouselCarouselViewController.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 18/01/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit
import Kingfisher

class CarouselViewController: UIViewController, CarouselViewInput, iCarouselDataSource, iCarouselDelegate {

    var output: CarouselViewOutput!

    var images = ["https://www.chiphell.com/data/attachment/block/b5/b552524799183379d18fd951dbc8be92.jpg",
                  "https://www.chiphell.com/data/attachment/block/fd/fdcc5d30705cf415eac610705a65a6d8.jpg",
                  "https://www.chiphell.com/data/attachment/block/2c/2c4e78583495fba2f41439541fa48e2e.jpg"]

    private lazy var carsouselView: iCarousel = {
        return iCarousel()
    }()

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = carsouselView
        carsouselView.bounces = false
        carsouselView.delegate = self
        carsouselView.dataSource = self
//        output.viewIsReady()
    }

    // MARK: CarouselViewInput
    func setupInitialState() {
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return images.count
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {

        let screenWidth = UIScreen.main.bounds.width

        let tempView = UIView(frame: CGRect(x:0, y:0, width:screenWidth, height:160))

        let frame = CGRect(x:0, y:0, width:screenWidth, height:160)
        let imageView = UIImageView()
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFit

        imageView.kf.setImage(with: URL(string: images[index]))

        tempView.addSubview(imageView)
        return tempView
    }
}

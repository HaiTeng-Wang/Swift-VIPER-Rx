//
//  ViewController.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 1/3/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    let disposebag = DisposeBag()

    private lazy var button: UIButton = {
    let a = UIButton(type: .custom)
        return a
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue

        view.addSubview(button)

        button.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.center.equalTo(view)
        }
        button.setTitle("Banner", for:UIControlState.normal)

        button.rx.tap.subscribe(onNext: { _ in
            self.getHomeBannerData()
        })
        .addDisposableTo(disposebag)
        
        DataManager.getDataFromCache(path: "haha")
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { (nsdata) in
            print("onNext I found \(nsdata)!")
        }, onError: { (error) in
            print("onError I found \(error)!")
        }, onCompleted: {
            print("onCompleted")
        }).addDisposableTo(disposebag)
    }

    private func getHomeBannerData() {
        let bannerRequest = DataManager.getBanner(path: "app-home-carousel")

            bannerRequest
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { (string) in
                    print(string)
            })
            .addDisposableTo(disposebag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

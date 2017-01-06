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
            self.getBannerData()
        })
        .addDisposableTo(disposebag)

    }

    private func getBannerData() {
        Network.request(target: .banner("app-home-carousel"))
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

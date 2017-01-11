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

    private lazy var button1: UIButton = {
        return UIButton(type: .custom)
    }()

    private lazy var button2: UIButton = {
        return UIButton(type: .custom)
    }()

    private lazy var button3: UIButton = {
        return UIButton(type: .custom)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue

        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)

        button1.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.top.equalTo(view)
        }
        button1.setTitle("Login", for:UIControlState.normal)

        button1.rx.tap.subscribe(onNext: { _ in
            self.login(userName:"13651999507", passwd:"123456")
        })
            .addDisposableTo(disposebag)

        button2.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.center.equalTo(view)
        }
        button2.setTitle("Logout", for:UIControlState.normal)

        button2.rx.tap.subscribe(onNext: { _ in
            self.logout()
        })
            .addDisposableTo(disposebag)

        button3.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.bottom.equalTo(view)
        }
        button3.setTitle("Banner", for:UIControlState.normal)

        button3.rx.tap.subscribe(onNext: { _ in
            self.getHomeBannerData()
        })
        .addDisposableTo(disposebag)
    }

    private func getHomeBannerData() {
            DataManager.getBanner(path: "app-home-carousel")
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { (banner) in
                    print("onNext I found \(banner.result?.data?[0].title)!")
                }, onError: { (error) in
                    print("onError I found \(error)!")
                }, onCompleted: {
                    print("onCompleted")
                }).addDisposableTo(disposebag)
    }

    private func login(userName: String, passwd: String) {
        DataManager.getSecureCode()
            .flatMap({ (secure) -> Observable<Login> in
                let secureKey = secure.result?.secureKey
                let secureCode = secure.result?.secureCode
                return DataManager.login(userName: userName, passwd: passwd, secureCode: secureCode!, secureKey: secureKey!)
            })
            .flatMap({ (login) -> Observable<AccountRealm> in
                let account = AccountRealm()
                account.credential = AccountDataMapper.mapLoginCredentialToCredentialRealm(credential: login.result!.credential!)
                account.user = AccountDataMapper.mapUserToUserRealm(user: login.result!.user!)
                return DatabaseManager.writeAccountToRealm(account: account)
            })
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (account) in
                AccountManager.sharedInstance.setUser(user: account.user!)
                AccountManager.sharedInstance.setCredential(credential: account.credential!)
                print("onNext I found credential \(account.credential?.bearer)!")
            }, onError: { (error) in
                print("onError I found \(error)!")
            }, onCompleted: {
                print("onCompleted")
            }).addDisposableTo(disposebag)
    }

    private func logout() {
        AccountManager.sharedInstance.logout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

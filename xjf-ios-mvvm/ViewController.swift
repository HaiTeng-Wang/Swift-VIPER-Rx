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
    
    private lazy var button:UIButton = {
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
        button.setTitle("haha", for:UIControlState.normal)
        
        Network.request(target: .banner("app-home-carousel"))
        .observeOn(MainScheduler.instance)
        .subscribe(
            onNext: { (string) in
           print(string)
        })
        .addDisposableTo(disposebag)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


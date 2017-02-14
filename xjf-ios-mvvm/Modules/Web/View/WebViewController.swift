//
//  WebWebViewController.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 14/02/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var url: String?

    var shareEnable: Bool = false

    private lazy var webView: WKWebView = self.createWebView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(url: String, shareEnable: Bool) {
        self.init(nibName: nil, bundle: nil)
        self.url = url
        self.shareEnable = shareEnable
    }

    override func loadView() {
        super.loadView()

        view.backgroundColor = UIColor.gray
        view.addSubview(webView)

        let screenWidth = UIScreen.main.bounds.width

        webView.snp.makeConstraints { make in
            make.width.equalTo(screenWidth)
            make.height.equalToSuperview()
        }

        let url = URL(string: "https://m.baidu.com")
        let ur = URLRequest(url: url!)
        webView.load(ur)
    }

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initNaviBar()
    }

    func initNaviBar() {
        if let naviVC = self.navigationController {
            naviVC.setNavigationBarHidden(false, animated: false)
            naviVC.navigationBar.backgroundColor = UIColor.gray
            self.title = "WEBVIEW"
        }
    }

    // MARK: WebViewInput
    func setupInitialState() {
    }

    func createWebView() -> WKWebView {
        let view = WKWebView()
        return view
    }
}

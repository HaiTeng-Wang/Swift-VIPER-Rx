//
//  WebWebViewController.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 14/02/2017.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import UIKit
import WebKit
import AppData

class WebViewController: UIViewController {

    var url: String?

    var shareEnable: Bool = false

    private lazy var webView: WKWebView = self.createWebView()
    private lazy var progressView: UIProgressView = self.createProgressView()

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
        view.addSubview(progressView)

        let screenWidth = UIScreen.main.bounds.width

        progressView.snp.makeConstraints { make in
            make.width.equalTo(screenWidth)
            make.height.equalTo(3)
        }

        webView.snp.makeConstraints { make in
            make.width.equalTo(screenWidth)
            make.height.equalToSuperview()
            make.top.equalTo(progressView.snp.top)
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
        }
    }

    func setNaviTitle(title: String?) {
        Logger.logInfo(message: "setNaviTitle \(title)")
        self.title = title
    }

    // MARK: WebViewInput
    func setupInitialState() {
    }

    func createWebView() -> WKWebView {
        let view = WKWebView()
        view.navigationDelegate = self
        view.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        return view
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.isHidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }

    func createProgressView() -> UIProgressView {
        let view = UIProgressView()
        view.backgroundColor = UIColor.gray
        view.progressTintColor = UIColor.blue
        view.trackTintColor = UIColor.gray
        view.progress = 0.3
        return view
    }

    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}

extension WebViewController:WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Logger.logInfo(message: "setNaviTitle A \(title)")
        self.setNaviTitle(title: webView.title)
    }
}

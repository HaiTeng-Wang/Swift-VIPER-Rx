//
//  WikiCard.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 2/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation

class WikiCardView: UIView {

    private lazy var headerView: CommonCardHeaderView = self.createHeaderView()
    private lazy var wikiCover: UIImageView = self.createWikiCoverView()
    private lazy var wikiTitle: UILabel = self.createWikiTitleView()
    private lazy var wikiContent: UILabel = self.createWikiContentView()

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        backgroundColor = UIColor.white

        headerView.setIcon(icon: UIImage(named: "WikiTitleIcon"))
        headerView.setTitle(title: "你知道么")

        addSubview(headerView)
        addSubview(wikiCover)
        addSubview(wikiTitle)
        addSubview(wikiContent)

        setupConstraints()
    }

    private func setupConstraints() {
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(48)
        }

        wikiCover.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(3)
            make.height.equalTo(wikiCover.snp.width).multipliedBy(9.0/16.0)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }

        wikiTitle.snp.makeConstraints { (make) in
            make.top.equalTo(wikiCover.snp.bottom).offset(12)
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }

        wikiContent.snp.makeConstraints { (make) in
            make.top.equalTo(wikiTitle.snp.bottom).offset(8)
            make.height.lessThanOrEqualTo(60)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.centerX.equalToSuperview()
        }
    }

    func setData(courseData: CourseData) {
        if let cover = courseData.cover {
            if let url = cover[0].url {
                print("image url: \(url)")
                wikiCover.kf.setImage(with: URL(string: url))
            }
        }

        wikiTitle.text = courseData.title
        wikiContent.text = courseData.summary

    }

    func createHeaderView() -> CommonCardHeaderView {
        let view = CommonCardHeaderView()
        return view
    }

    func createWikiCoverView() -> UIImageView {
        let view = UIImageView()
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        return view
    }

    func createWikiTitleView() -> UILabel {
        let view = UILabel()
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 18)
        view.numberOfLines = 1
        return view
    }

    func createWikiContentView() -> UILabel {
        let view = UILabel()
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 12)
        view.preferredMaxLayoutWidth = UIScreen.main.bounds.width - 40
        view.numberOfLines = 3
        return view
    }
}

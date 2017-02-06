//
//  CommonCardHeaderView.swift
//  xjf-ios-mvvm
//
//  Created by xijinfa on 2/6/17.
//  Copyright © 2017 xijinfa. All rights reserved.
//

import Foundation

class CommonCardHeaderView: UIView {

    private lazy var iconView: UIImageView = self.createIconView()
    private lazy var titleView: UILabel = self.createTitleView()
    private lazy var subTitleView: UILabel = self.createSubTitleView()

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
        addSubview(iconView)
        addSubview(titleView)
        addSubview(subTitleView)

        setupConstraints()
    }

    private func setupConstraints() {

        iconView.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.centerY.equalToSuperview()
            make.left.equalTo(16)
        }

        titleView.snp.makeConstraints { (make) in
            make.left.equalTo(45)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(200)
            make.height.equalToSuperview()
        }

        subTitleView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(200)
            make.height.equalToSuperview()
        }
    }

    func setIcon(icon: UIImage?) {
        iconView.image = icon
    }

    func setTitle(title: String) {
        titleView.text = title
    }

    func setSubTitle(subTitle: String) {
        subTitleView.text = subTitle
    }

    func createIconView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .center
        return view
    }

    func createTitleView() -> UILabel {
        let view = UILabel()
        view.textColor = UIColor.black
        view.font = UIFont.systemFont(ofSize: 15)
        view.numberOfLines = 1
        return view
    }

    func createSubTitleView() -> UILabel {
        let view = UILabel()
        view.textColor = UIColor.lightGray
        view.font = UIFont.systemFont(ofSize: 12)
        view.numberOfLines = 1
        return view
    }

}

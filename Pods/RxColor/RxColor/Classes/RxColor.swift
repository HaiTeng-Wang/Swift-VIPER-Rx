//
//  RxColor.swift
//
//  Created by Ivan Bruel on 06/06/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public extension UILabel {

  public var rx_textColor: AnyObserver<UIColor> {
    return UIBindingObserver(UIElement: self) { label, color in
      label.textColor = color
      }.asObserver()
  }
}

public extension UIButton {

  public var rx_titleColor: AnyObserver<UIColor> {
    return UIBindingObserver(UIElement: self) { button, color in
      button.setTitleColor(color, forState: .Normal)
      }.asObserver()
  }

  public var rx_color: AnyObserver<UIColor> {
    return UIBindingObserver(UIElement: self) { button, color in
      button.setTitleColor(color, forState: .Normal)
      button.tintColor = color
      }.asObserver()
  }
}

public extension UIView {

  public var rx_backgroundColor: AnyObserver<UIColor> {
    return UIBindingObserver(UIElement: self) { view, color in
      view.backgroundColor = color
      }.asObserver()
  }
}

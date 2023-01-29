//
//  Extensions.swift
//  piPiano
//
//  Created by superw on 07/12/2018.
//  Copyright © 2018 superw. All rights reserved.
//

import UIKit

@IBDesignable
extension UIButton {

  @IBInspectable
  var borderWith : CGFloat {
    set {
      layer.borderWidth = newValue
    }
    get {
      layer.borderWidth
    }
  }
  @IBInspectable
  var cornerRadius : CGFloat {
    set {
      layer.cornerRadius = newValue
    }
    get {
      layer.cornerRadius
    }
  }
  @IBInspectable
  var borderColor : UIColor? {
    set {
      guard let uiColor = newValue else { return }
      layer.borderColor = uiColor.cgColor
    }
    get {
      guard let color = layer.borderColor else { return nil }
      return UIColor(cgColor: color)
    }
  }

}


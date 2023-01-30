//
//  Extensions.swift
//  piPiano
//
//  Created by iPonCode on 07/12/2018.
//  Copyright © 2018 iPon.es All rights reserved.
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


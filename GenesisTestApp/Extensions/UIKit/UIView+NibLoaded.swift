//
//  UIView+NibLoaded.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

extension UIView {
  
  @discardableResult
  func fromNib<T : UIView>() -> T? {
    let nibName = String(describing: type(of: self))
    guard let contentView = Bundle.main.loadNibNamed(nibName,
                                                     owner: self,
                                                     options: nil)?
      .first as? T else { return nil }
    self.addSubview(contentView)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.frame = self.bounds
    contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
    return contentView
  }
  
}

protocol XibDesignable : class {}

extension XibDesignable where Self : UIView {
  
  static func instantiateFromXib() -> Self {
    let dynamicMetatype = Self.self
    let bundle = Bundle(for: dynamicMetatype)
    let nib = UINib(nibName: "\(dynamicMetatype)", bundle: bundle)
    
    guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
      fatalError("Could not load view from nib file.")
    }
    return view
  }
  
}

//
//  UITableView+RegisterCell.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

extension UITableView {
  
  /**
   The shorter method for cell registering
   */
  func register<T: UITableViewCell>(_: T.Type) {
    register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  /**
   The shorter method for cell registering with Nib
   */
  func registerNib<T: UITableViewCell>(_: T.Type) where T: NibLoadableView {
    let bundle = Bundle(for: T.self)
    let nib = UINib(nibName: T.nibName, bundle: bundle)
    
    register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
  }
  
  /**
   The shorter method for reusable cell registering
   */
  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
      #if DEBUG
        fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
      #else
        return T()
      #endif
    }
    
    return cell
  }
  
}

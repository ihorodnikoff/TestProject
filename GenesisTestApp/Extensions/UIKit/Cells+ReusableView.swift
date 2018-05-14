//
//  Cells+ReusableView.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

protocol ReusableView: class {
  static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  
  static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
  
}

extension UICollectionViewCell: ReusableView {}
extension UITableViewCell: ReusableView {}

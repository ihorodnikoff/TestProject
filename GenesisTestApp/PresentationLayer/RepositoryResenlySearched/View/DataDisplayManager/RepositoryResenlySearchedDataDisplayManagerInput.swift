//
//  RepositoryResenlySearchedDataDisplayManagerInput.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/14/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

protocol RepositoryResenlySearchedDataDisplayManagerInput {
  func configure(with tableView: UITableView)
  func update(source: [RepositoryModel])
  
  func applyEditingStyle()
  func applyDefaultStyle()
}

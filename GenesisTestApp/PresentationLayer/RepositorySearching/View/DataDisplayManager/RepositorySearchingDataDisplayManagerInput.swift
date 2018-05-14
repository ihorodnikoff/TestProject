//
//  RepositorySearchingDataDisplayManagerInput.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

protocol RepositorySearchingDataDisplayManagerInput: class {
  func configure(with tableView: UITableView)
  func update(source: [RepositoryModel])
}

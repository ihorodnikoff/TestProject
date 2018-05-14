//
//  RepositorySearchingDataDisplayManagerOutput.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

protocol RepositorySearchingDataDisplayManagerOutput: class {
  func didSelect(repository: RepositoryModel)
  func loadNewPortionFrom(page: Int)
}

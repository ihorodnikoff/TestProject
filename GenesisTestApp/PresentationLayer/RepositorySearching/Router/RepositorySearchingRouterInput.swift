//
//  RepositorySearchingRouterInput.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import Foundation

protocol RepositorySearchingRouterInput: class {
  func presentDetailsView(by url: URL)
  func showResentlySearced(results: [RepositoryModel])
}

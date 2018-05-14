//
//  RepositorySearchingInteractorInput.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import Foundation

protocol RepositorySearchingInteractorInput: class {
  func prepareForSearching()
  func searchRepositoryWith(name: String, page: Int, isPagingEnable: Bool)
  func obtainSavedRepositories() -> [RepositoryModel]
  func update(repository: RepositoryModel)
}

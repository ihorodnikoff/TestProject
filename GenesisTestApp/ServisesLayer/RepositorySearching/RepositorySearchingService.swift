//
//  RepositorySearchingService.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

protocol RepositorySearchingService {
  
  var successHandler: (([RepositoryModel]) -> Void)? { get set }
  
  func searchRepositories(named name: String, withPage page: Int, isPagingEnable: Bool)
  func cancelAllRequests()
  func obtainPreviousResults() -> [RepositoryModel]
  func update(repository: RepositoryModel)
  
}

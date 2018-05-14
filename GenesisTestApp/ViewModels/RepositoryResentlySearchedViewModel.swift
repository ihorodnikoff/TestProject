//
//  RepositoryResentlySearchedViewModel.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/14/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

struct RepositoryResentlySearchedViewModel {
  var repositoryModels: [RepositoryModel]
  
  init(repositories: [RepositoryModel]) {
    self.repositoryModels = repositories
  }
}

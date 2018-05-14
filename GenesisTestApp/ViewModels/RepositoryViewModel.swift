//
//  RepositoryViewModel.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

struct RepositoryViewModel {
  let name: String
  let starsNumber: Int
  let url: String
  var isViewed: Bool
  
  init(model: RepositoryModel) {
    self.name = model.shortName
    self.starsNumber = model.starsNumber
    self.url = model.url
    self.isViewed = model.isViewed
  }
}

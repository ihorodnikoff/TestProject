//
//  SearchingResponseModel.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

struct SearchResponseModel {
  let repositories: [RepositoryModel]
  
  enum CodingKeys: String, CodingKey {
    case items
  }
}

extension SearchResponseModel: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    repositories = try container.decode([RepositoryModel].self, forKey: .items)
  }
}

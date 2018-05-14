//
//  RepositoryModel.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

struct RepositoryModel {
  struct C {
    static let charactersLimit = 30
  }
  
  var name: String
  var starsNumber: Int
  var url: String
  var shortName: String {
    if name.count < C.charactersLimit {
      return name
    } else {
      let startIndex = name.startIndex
      let endIndex = name.index(startIndex, offsetBy: C.charactersLimit)
      return String(name[startIndex..<endIndex])
    }
  }
  
  var isViewed = false
  
  enum CodingKeys: String, CodingKey {
    case name = "full_name"
    case starsNumber = "stargazers_count"
    case url = "html_url"
  }
}

//MARK: - Codable

extension RepositoryModel: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    starsNumber = try container.decode(Int.self, forKey: .starsNumber)
    url = try container.decode(String.self, forKey: .url)
  }  
}

extension RepositoryModel {
  init(repositoryManagedObject: RepositoryManagedObject) {
    name = repositoryManagedObject.name
    starsNumber = repositoryManagedObject.starsNumber
    url = repositoryManagedObject.url
    isViewed = repositoryManagedObject.isViewed
  }
}

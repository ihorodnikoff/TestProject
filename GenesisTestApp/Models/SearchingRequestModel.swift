//
//  SearchingRequestModel
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

struct SearchingRequestModel {
  let searchingName: String
  let page: Int
  let numbersPerPage: Int
  
  enum CodingKeys: String, CodingKey {
    case searchingName = "q"
    case page = "page"
    case numbersPerPage = "per_page"
  }
}

extension SearchingRequestModel: Encodable {
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(searchingName, forKey: .searchingName)
    try container.encode(page, forKey: .page)
    try container.encode(numbersPerPage, forKey: .numbersPerPage)
  }
}

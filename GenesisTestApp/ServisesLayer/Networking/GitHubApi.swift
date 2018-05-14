//
//  GitHubApi.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation
import Moya

enum GitHubApi {
  case search(model: SearchingRequestModel)
}

//TODO: - Configure with API documentation

extension GitHubApi: TargetType {
  
  var baseURL: URL { return URL(string: ApiConstants.baseURL)! }
  
  var path: String {
    switch self {
    case .search:
      return ApiConstants.Endpoints.search
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .search:
      return .get
    }
  }
  
  var task: Task {
    switch self {
    case .search(let model):
      let params = try! model.asDictionary()
      return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
  }
  
  var sampleData: Data {
    switch self {
    case .search:
      return "".utf8Encoded
    }
  }
  
  var headers: [String: String]? {
    switch self {
    case .search:
      return nil
    }
  }
 
}

// MARK: - Helpers

private extension String {
  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
}

//
//  Encodable+toDict.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

extension Encodable {
  func asDictionary() throws -> [String: Any] {
    let data = try JSONEncoder().encode(self)
    guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
      throw NSError()
    }
    return dictionary
  }
}

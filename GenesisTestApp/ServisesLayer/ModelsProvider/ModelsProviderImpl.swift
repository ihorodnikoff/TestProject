//
//  ModelsProviderImpl.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

struct ModelsProviderImpl {}

extension ModelsProviderImpl: ModelsProvider {
  
  func make<T: Decodable>(_: T.Type, data: Data) throws -> T? {
    do {
      return try JSONDecoder().decode(T.self, from: data)
    } catch let error {
      //throw error
      debugPrint(error.localizedDescription)
      return nil
    }
  }
  
}

//
//  ModelsProvider.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

protocol ModelsProvider {
  func make<T: Decodable>(_: T.Type, data: Data) throws -> T?
}

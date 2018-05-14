//
//  ModelTransfer.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

protocol ModelTransfer {
  /// Type of model that is being transferred
  associatedtype ModelType
  
  /// Updates view with `model`.
  func update(with model: ModelType)
}

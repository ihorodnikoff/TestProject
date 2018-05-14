//
//  ControllersAssembly.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation
import Swinject

final class ControllersAssembly {
  
  static let container: [Assembly] = {
    return [
      //register modules
      RepositorySearchingAssembly(),
      RepositoryDetailsAssembly(),
      RepositoryResenlySearchedAssembly()
      ]
  }()
  
}

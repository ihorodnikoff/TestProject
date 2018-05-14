//
//  AppAssembly.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation
import Swinject

final class AppAssembly {
  
  static let current: Assembler = {
    var assemblies: [Assembly] = []
    //add controllers dependencies && services
    assemblies.append(ServicesAssembly())
    assemblies.append(contentsOf: ControllersAssembly.container)
    return Assembler(assemblies)
  }()
  
  private init() {}
  
}

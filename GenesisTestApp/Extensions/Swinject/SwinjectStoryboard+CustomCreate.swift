//
//  SwinjectStoryboard+CustomCreate.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
  
  class func create<T: UIViewController>(_: T.Type, container: Container) -> SwinjectStoryboard {
    let name = String(describing: type(of: T.self)).components(separatedBy: ".").first!
    return SwinjectStoryboard.create(name: name,
                                     bundle: nil,
                                     container: container)
  }
  
  class func create<T: UIViewController>(_: T.Type) -> SwinjectStoryboard {
    let container = AppAssembly.current.resolver as! Container
    return create(T.self, container: container)
  }
  
}


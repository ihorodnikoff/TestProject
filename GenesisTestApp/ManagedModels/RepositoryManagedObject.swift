//
//  RepositoryManagedObject.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import RealmSwift

class RepositoryManagedObject: Object {
  @objc dynamic var name: String = ""
  @objc dynamic var starsNumber: Int = 0
  @objc dynamic var url: String = ""
  @objc dynamic var isViewed: Bool = false
  
  override static func primaryKey() -> String? {
    return "url"
  }
}

extension RepositoryManagedObject {
  convenience init(repository: RepositoryModel) {
    self.init()
    
    name = repository.name
    starsNumber = repository.starsNumber
    url = repository.url
    isViewed = repository.isViewed
  }
}

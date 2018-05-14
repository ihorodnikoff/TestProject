//
//  RepositoryResenlySearchedInteractor.swift
//  Rentberry
//
//  Created by i.horodnikov on 14/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

class RepositoryResenlySearchedInteractor {

  // MARK: - Injected

  weak var output: RepositoryResenlySearchedInteractorOutput?
  var dataBase: DataBase!

}

// MARK: - RepositoryResenlySearchedInteractorInput

extension RepositoryResenlySearchedInteractor: RepositoryResenlySearchedInteractorInput {
  func update(repositories: [RepositoryModel]) {
    dataBase.deleteAllObjectsOfType(RepositoryManagedObject.self)
    repositories.forEach {
      dataBase.createOrUpdate(model: $0, with: RepositoryManagedObject.init)
    }
  }
  
}

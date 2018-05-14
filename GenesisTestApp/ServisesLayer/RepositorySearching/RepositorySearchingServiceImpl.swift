//
//  RepositorySearchingServiceImpl.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation
import Moya

final class RepositorySearchingServiceImpl: NetworkProvider {
  
  struct C {
    static let repositoriesPerPage = 15
    //Using strings instead of unique ObjectIdentifier connected with limited time
    static let firstRequestID = "firstRequest"
    static let secondRequestID = "firstRequest"
  }
  
  //MARK: - Injected
  
  var modelsProvider: ModelsProvider!
  var dataBase: DataBase!
  
  //MAKR: - Properties
  
  private let dispatchGroup = DispatchGroup()
  private var outgoingRequests = [String: Cancellable]()
  private var repositories = [RepositoryModel]()
  
  var successHandler: (([RepositoryModel]) -> Void)?
  
  //MARK: - Methods
  
  func cancelAllRequests() {
    outgoingRequests.forEach { $0.value.cancel() }
    outgoingRequests.removeAll()
  }
  
  func obtain(response: Response) {
    guard let repos = try! modelsProvider.make(SearchResponseModel.self,
                                               data: response.data)?.repositories
    else {
      return
    }
    repositories.append(contentsOf: repos)
  }
  
}

extension RepositorySearchingServiceImpl: RepositorySearchingService {
  
  func searchRepositories(named name: String,
                          withPage page: Int,
                          isPagingEnable: Bool) {
    if !isPagingEnable {
      repositories.removeAll()
    }
    
    let firstSearchModel = SearchingRequestModel(searchingName: name,
                                                 page: page,
                                                 numbersPerPage: C.repositoriesPerPage)
    let secondSearchModel = SearchingRequestModel(searchingName: name,
                                                  page: page + 1,
                                                  numbersPerPage: C.repositoriesPerPage)
    
    dispatchGroup.enter()
    let firstRequest = defaultProvider.request(.search(model: firstSearchModel)) {
      [weak self] (result) in
      guard let strongSelf = self else { return }
      strongSelf.dispatchGroup.leave()
      switch result {
      case .success(let response):
        strongSelf.obtain(response: response)
      case .failure(let error):
        debugPrint(error.localizedDescription)
      }
    }
    
    dispatchGroup.enter()
    let secondRequest = defaultProvider.request(.search(model: secondSearchModel)) {
      [weak self] (result) in
      guard let strongSelf = self else { return }
      strongSelf.dispatchGroup.leave()
      switch result {
      case .success(let response):
        strongSelf.obtain(response: response)
      case .failure(let error):
        debugPrint(error.localizedDescription)
      }
    }
    
    outgoingRequests[C.firstRequestID] = firstRequest
    outgoingRequests[C.secondRequestID] = secondRequest
    
    dispatchGroup.notify(queue: .main) { [weak self] in
      guard let strongSelf = self else { return }
      strongSelf.dataBase.deleteAllObjectsOfType(RepositoryManagedObject.self)
      strongSelf.repositories.forEach {
        strongSelf.dataBase.createOrUpdate(model: $0, with: RepositoryManagedObject.init)
      }
      strongSelf.successHandler?(strongSelf.repositories)
      strongSelf.outgoingRequests.removeAll()
    }
    
  }
  
  func obtainPreviousResults() -> [RepositoryModel] {
    let models = FetchRequest<[RepositoryModel], RepositoryManagedObject>(transformer: { $0.map(RepositoryModel.init) })
    return dataBase.fetch(with: models)
  }
  
  func update(repository: RepositoryModel) {
    dataBase.createOrUpdate(model: repository, with: RepositoryManagedObject.init)
  }
  
}

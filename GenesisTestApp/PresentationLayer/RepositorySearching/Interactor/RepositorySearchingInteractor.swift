//
//  RepositorySearchingInteractor.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//
import Foundation

class RepositorySearchingInteractor {

  // MARK: - Injected

  weak var output: RepositorySearchingInteractorOutput?
  var searchingService: RepositorySearchingService!
  
  //MARK: - Properties
  
  private var pendingRequestWorkItem: DispatchWorkItem?
  
  //MARK: - Methods
  
  func configureSearchingService() {
    searchingService.successHandler = { [weak self] repositories in
      guard let strongSelf = self else { return }
      strongSelf.output?.obtainRepositories(repositories)
    }
  }

}

// MARK: - RepositorySearchingInteractorInput

extension RepositorySearchingInteractor: RepositorySearchingInteractorInput {
  func update(repository: RepositoryModel) {
    searchingService.update(repository: repository)
  }
  
  func obtainSavedRepositories() -> [RepositoryModel] {
    return searchingService.obtainPreviousResults()
  }
  
  func prepareForSearching() {
    configureSearchingService()
    output?.obtainRepositories(searchingService.obtainPreviousResults())
  }
  
  func searchRepositoryWith(name: String, page: Int, isPagingEnable: Bool) {
    
    pendingRequestWorkItem?.cancel()
    let requestWorkItem = DispatchWorkItem { [weak self] in
      guard let strongSelf = self else { return }
      strongSelf.searchingService.searchRepositories(named: name, withPage: page, isPagingEnable: isPagingEnable)
    }
    pendingRequestWorkItem = requestWorkItem
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(700),
                                  execute: requestWorkItem)
  }
}

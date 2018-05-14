//
//  RepositorySearchingPresenter.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//
import Foundation

class RepositorySearchingPresenter {

  // MARK: - Injected

  weak var view: RepositorySearchingViewInput?
  var interactor: RepositorySearchingInteractorInput!
  var router: RepositorySearchingRouterInput!

}

// MARK: - RepositorySearchingModuleInput

extension RepositorySearchingPresenter: RepositorySearchingModuleInput {

}

// MARK: - RepositorySearchingViewOutput

extension RepositorySearchingPresenter: RepositorySearchingViewOutput {
  
  func viewIsReady() {
    interactor.prepareForSearching()
  }
  
  func searchRepositoryNamed(_ name: String, onPage page: Int, isPagingEnable: Bool) {
    interactor.searchRepositoryWith(name: name, page: page, isPagingEnable: isPagingEnable)
  }
  
  func showRecentlySearchedResults() {
    router.showResentlySearced(results: interactor.obtainSavedRepositories())
  }
  
  func obtainSelected(repository: RepositoryModel) {
    guard let url = URL(string: repository.url) else { return }
    interactor.update(repository: repository)
    router.presentDetailsView(by: url)
  }

}

// MARK: - RepositorySearchingInteractorOutput

extension RepositorySearchingPresenter: RepositorySearchingInteractorOutput {
  func obtainRepositories(_ repositories: [RepositoryModel]) {
    view?.update(source: repositories)
  }
}

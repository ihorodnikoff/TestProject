//
//  RepositoryResenlySearchedPresenter.swift
//  Rentberry
//
//  Created by i.horodnikov on 14/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

class RepositoryResenlySearchedPresenter {

  // MARK: - Injected

  weak var view: RepositoryResenlySearchedViewInput?
  var interactor: RepositoryResenlySearchedInteractorInput!
  var router: RepositoryResenlySearchedRouterInput!
  var viewModel: RepositoryResentlySearchedViewModel!
  
  //MARK: - Properties
  
  private var didChanged = false

}

// MARK: - RepositoryResenlySearchedModuleInput

extension RepositoryResenlySearchedPresenter: RepositoryResenlySearchedModuleInput {

}

// MARK: - RepositoryResenlySearchedViewOutput

extension RepositoryResenlySearchedPresenter: RepositoryResenlySearchedViewOutput {
  func update(results: [RepositoryModel]) {
    didChanged = true
    viewModel.repositoryModels = results
  }
  
  func viewWillDisappear() {
    if didChanged {
      interactor.update(repositories: viewModel.repositoryModels)
    }
  }
  
  func viewIsReady() {
    view?.update(with: viewModel.repositoryModels)
  }

}

// MARK: - RepositoryResenlySearchedInteractorOutput

extension RepositoryResenlySearchedPresenter: RepositoryResenlySearchedInteractorOutput {

}

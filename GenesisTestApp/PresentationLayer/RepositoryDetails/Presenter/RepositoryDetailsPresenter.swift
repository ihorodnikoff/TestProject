//
//  RepositoryDetailsPresenter.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//
import Foundation

class RepositoryDetailsPresenter {

  // MARK: - Injected

  weak var view: RepositoryDetailsViewInput?
  var interactor: RepositoryDetailsInteractorInput!
  var router: RepositoryDetailsRouterInput!
  
  //MARK: - Properties
  
  var url: URL!

}

// MARK: - RepositoryDetailsModuleInput

extension RepositoryDetailsPresenter: RepositoryDetailsModuleInput {

}

// MARK: - RepositoryDetailsViewOutput

extension RepositoryDetailsPresenter: RepositoryDetailsViewOutput {
  
  func viewIsReady() {
    view?.configure(with: url)
  }
  
  func dismissView() {
    router.dismissView()
  }

}

// MARK: - RepositoryDetailsInteractorOutput

extension RepositoryDetailsPresenter: RepositoryDetailsInteractorOutput {

}

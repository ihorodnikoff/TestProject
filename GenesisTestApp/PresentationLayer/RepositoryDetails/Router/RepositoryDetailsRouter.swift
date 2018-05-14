//
//  RepositoryDetailsRouter.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

class RepositoryDetailsRouter {
  weak var view: RepositoryDetailsViewInput?
}

// MARK: RepositoryDetailsRouterInput

extension RepositoryDetailsRouter: RepositoryDetailsRouterInput {
  func dismissView() {
    view?.dismiss()
  }
}

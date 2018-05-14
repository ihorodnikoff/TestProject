//
//  RepositoryDetailsAssembly.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class RepositoryDetailsAssembly {

}

// MARK: - Assembly

extension RepositoryDetailsAssembly: Assembly {

  func assemble(container: Container) {
    container.register(RepositoryDetailsInteractor.self) { (r, presenter: RepositoryDetailsPresenter) in
      let interactor = RepositoryDetailsInteractor()
      interactor.output = presenter
      return interactor
    }

    container.register(RepositoryDetailsRouter.self) { (r, viewController: RepositoryDetailsViewController) in
      let router = RepositoryDetailsRouter()
      router.view = viewController
      return router
    }

    container.register(RepositoryDetailsPresenter.self) { (r, viewController: RepositoryDetailsViewController) in
      let presenter = RepositoryDetailsPresenter()
      presenter.view = viewController
      presenter.interactor = r.resolve(RepositoryDetailsInteractor.self, argument: presenter)
      presenter.router = r.resolve(RepositoryDetailsRouter.self, argument: viewController)
      return presenter
    }

    container.storyboardInitCompleted(RepositoryDetailsViewController.self) { (r, viewController) in
      viewController.output = r.resolve(RepositoryDetailsPresenter.self, argument: viewController)
    }
  }

}

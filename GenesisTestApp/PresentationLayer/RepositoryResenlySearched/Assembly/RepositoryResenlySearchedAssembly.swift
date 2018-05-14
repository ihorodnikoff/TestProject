//
//  RepositoryResenlySearchedAssembly.swift
//  Rentberry
//
//  Created by i.horodnikov on 14/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class RepositoryResenlySearchedAssembly {

}

// MARK: - Assembly

extension RepositoryResenlySearchedAssembly: Assembly {

  func assemble(container: Container) {
    container.register(RepositoryResenlySearchedInteractor.self) { (r, presenter: RepositoryResenlySearchedPresenter) in
      let interactor = RepositoryResenlySearchedInteractor()
      interactor.output = presenter
      interactor.dataBase = r.resolve(DataBase.self)
      return interactor
    }

    container.register(RepositoryResenlySearchedRouter.self) { (r, viewController: RepositoryResenlySearchedViewController) in
      let router = RepositoryResenlySearchedRouter()
      router.view = viewController
      return router
    }

    container.register(RepositoryResenlySearchedPresenter.self) { (r, viewController: RepositoryResenlySearchedViewController) in
      let presenter = RepositoryResenlySearchedPresenter()
      presenter.view = viewController
      presenter.interactor = r.resolve(RepositoryResenlySearchedInteractor.self, argument: presenter)
      presenter.router = r.resolve(RepositoryResenlySearchedRouter.self, argument: viewController)
      return presenter
    }
    
    container.register(RepositoryResenlySearchedDataDisplayManagerInput.self) { (r, viewController: RepositoryResenlySearchedViewController) in
      let dataDisplayManager = RepositoryResenlySearchedDataDisplayManager()
      dataDisplayManager.output = viewController
      return dataDisplayManager
    }

    container.storyboardInitCompleted(RepositoryResenlySearchedViewController.self) { (r, viewController) in
      viewController.output = r.resolve(RepositoryResenlySearchedPresenter.self, argument: viewController)
      viewController.dataDisplayManager = r.resolve(RepositoryResenlySearchedDataDisplayManagerInput.self, argument: viewController)
    }
  }

}

//
//  RepositorySearchingAssembly.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class RepositorySearchingAssembly {

}

// MARK: - Assembly

extension RepositorySearchingAssembly: Assembly {

  func assemble(container: Container) {
    container.register(RepositorySearchingInteractor.self) { (r, presenter: RepositorySearchingPresenter) in
      let interactor = RepositorySearchingInteractor()
      interactor.output = presenter
      interactor.searchingService = r.resolve(RepositorySearchingService.self)
      return interactor
    }

    container.register(RepositorySearchingRouter.self) { (r, viewController: RepositorySearchingViewController) in
      let router = RepositorySearchingRouter()
      router.view = viewController
      router.controllersFactory = r.resolve(ControllersFactory.self)
      return router
    }

    container.register(RepositorySearchingPresenter.self) { (r, viewController: RepositorySearchingViewController) in
      let presenter = RepositorySearchingPresenter()
      presenter.view = viewController
      presenter.interactor = r.resolve(RepositorySearchingInteractor.self, argument: presenter)
      presenter.router = r.resolve(RepositorySearchingRouter.self, argument: viewController)
      return presenter
    }
    
    container.register(RepositorySearchingDataDisplayManagerInput.self) { (r, viewController: RepositorySearchingViewController) in
      let dataDisplayManager = RepositorySearchingDataDisplayManager()
      dataDisplayManager.output = viewController
      return dataDisplayManager
    }

    container.storyboardInitCompleted(RepositorySearchingViewController.self) { (r, viewController) in
      viewController.output = r.resolve(RepositorySearchingPresenter.self, argument: viewController)
      viewController.dataDisplayManager = r.resolve(RepositorySearchingDataDisplayManagerInput.self, argument: viewController)
    }
  }

}

//
//  ServicesAssembly.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Swinject

final class ServicesAssembly: Assembly {
  
  func assemble(container: Container) {
    registerControllersFactory(in: container)
    registerModelsProvider(in: container)
    registerDataBase(in: container)
    registerRepositorySearchingService(in: container)
  }
  
  //MARK: - Methods
  
  private func registerControllersFactory(in container: Container) {
    container.register(ControllersFactory.self) { _ in
      ControllersFactoryImpl()
    }
  }
  
  private func registerModelsProvider(in container: Container) {
    container.register(ModelsProvider.self) { _ in
      ModelsProviderImpl()
    }
  }
  
  private func registerDataBase(in container: Container) {
    container.register(DataBase.self) { _ in
      DatabaseImpl()
    }.inObjectScope(.container)
  }
  
  private func registerRepositorySearchingService(in container: Container) {
    container.register(RepositorySearchingService.self) { _ in
      let service = RepositorySearchingServiceImpl()
      service.modelsProvider = container.resolve(ModelsProvider.self)
      service.dataBase = container.resolve(DataBase.self)
      return service
    }
  }
  
}

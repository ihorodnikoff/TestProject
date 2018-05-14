//
//  ControllersFactory.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard

final class ControllersFactoryImpl {
  
  func make<T: UIViewController>(_: T.Type) -> T {
    let storyBoard = SwinjectStoryboard.create(T.self)
    let controller = storyBoard.instantiate(T.self)
    return controller
  }
  
}

//MARK: - ControllersFactoty

extension ControllersFactoryImpl: ControllersFactory {
  
  func makeRepositorySearchingViewEmbededInNavigation() -> UIViewController {
    let view = make(RepositorySearchingViewController.self)
    let navigationController = UINavigationController(rootViewController: view)
    return navigationController
  }
  
  func makeRepositoryDetailsView(with url: URL) -> RepositoryDetailsViewController {
    let view = make(RepositoryDetailsViewController.self)
    view.output.url = url
    return view
  }
  
  func makeRepositoryResentlySearchedView(with viewModel: RepositoryResentlySearchedViewModel) -> RepositoryResenlySearchedViewController {
    let view = make(RepositoryResenlySearchedViewController.self)
    view.output.viewModel = viewModel
    return view
  }

}

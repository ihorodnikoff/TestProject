//
//  RepositorySearchingRouter.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//
import UIKit

class RepositorySearchingRouter {
  weak var view: RepositorySearchingViewInput?
  var controllersFactory: ControllersFactory!
}

// MARK: RepositorySearchingRouterInput

extension RepositorySearchingRouter: RepositorySearchingRouterInput {
  func showResentlySearced(results: [RepositoryModel]) {
    let fromView = (view as? RepositorySearchingViewController)?.navigationController
    let toView = controllersFactory.makeRepositoryResentlySearchedView(with: RepositoryResentlySearchedViewModel(repositories: results))
    fromView?.pushViewController(toView, animated: true)
  }
  
  func presentDetailsView(by url: URL) {
    let fromView = view as? RepositorySearchingViewController
    let toView = controllersFactory.makeRepositoryDetailsView(with: url)
    toView.transitioningDelegate = fromView
    toView.modalPresentationStyle = .overCurrentContext
    toView.modalTransitionStyle = .coverVertical
    fromView?.present(toView, animated: true, completion: nil)
  }

}

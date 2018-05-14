//
//  ControllersFactory1.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//
import UIKit

protocol ControllersFactory {
  
  func makeRepositorySearchingViewEmbededInNavigation() -> UIViewController
  func makeRepositoryDetailsView(with url: URL) -> RepositoryDetailsViewController
  func makeRepositoryResentlySearchedView(with viewModel: RepositoryResentlySearchedViewModel) -> RepositoryResenlySearchedViewController

}

//
//  RepositoryResenlySearchedViewOutput.swift
//  Rentberry
//
//  Created by i.horodnikov on 14/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

protocol RepositoryResenlySearchedViewOutput: class {
  var viewModel: RepositoryResentlySearchedViewModel! { get set }
  
  func viewIsReady()
  func viewWillDisappear()
  func update(results: [RepositoryModel])
}

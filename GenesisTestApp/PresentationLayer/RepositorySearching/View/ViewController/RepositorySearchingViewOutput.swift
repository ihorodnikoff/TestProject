//
//  RepositorySearchingViewOutput.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

protocol RepositorySearchingViewOutput: class {
  
  func viewIsReady()
  func searchRepositoryNamed(_ name: String, onPage page: Int, isPagingEnable: Bool)
  func showRecentlySearchedResults()
  func obtainSelected(repository: RepositoryModel)
  
}

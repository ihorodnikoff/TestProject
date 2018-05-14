//
//  RepositoryResenlySearchedViewController.swift
//  Rentberry
//
//  Created by i.horodnikov on 14/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import UIKit

class RepositoryResenlySearchedViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Injected

  var output: RepositoryResenlySearchedViewOutput!
  var dataDisplayManager: RepositoryResenlySearchedDataDisplayManagerInput!
  
  var isEditStyle = false

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureDataDisplayManager()
    output.viewIsReady()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    output.viewWillDisappear()
  }
  
  //MARK: - Methods
  
  func configureDataDisplayManager() {
    dataDisplayManager.configure(with: tableView)
  }
  
  //MARK: - Actions
  
  @IBAction func editDidTap(_ sender: UIBarButtonItem) {
    isEditStyle = !isEditStyle
    if isEditStyle {
      dataDisplayManager.applyEditingStyle()
    } else {
      dataDisplayManager.applyDefaultStyle()
    }
  }

}

// MARK: - RepositoryResenlySearchedViewInput

extension RepositoryResenlySearchedViewController: RepositoryResenlySearchedViewInput {
  
  func update(with results: [RepositoryModel]) {
    dataDisplayManager.update(source: results)
  }

}

extension RepositoryResenlySearchedViewController: RepositoryResenlySearchedDataDisplayManagerOutput {
  func configure(results: [RepositoryModel]) {
    output.update(results: results)
  }
}

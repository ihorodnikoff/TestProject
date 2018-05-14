//
//  RepositorySearchingViewController.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import UIKit

class RepositorySearchingViewController: UIViewController {
  
  //MARK: - Oulets
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var recent: UIBarButtonItem!

  // MARK: - Injected

  var output: RepositorySearchingViewOutput!
  var dataDisplayManager: RepositorySearchingDataDisplayManagerInput!

  // MARK: - Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureDataDisplayManager()
    configureSearchBar()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    output.viewIsReady()
  }
  
  //MARK: - Actions
  
  @IBAction func recentDidTap(_ sender: UIBarButtonItem) {
    output.showRecentlySearchedResults()
  }
  
  //MARK: - Methods
  
  func configureDataDisplayManager() {
    dataDisplayManager.configure(with: tableView)
  }
  
  func configureSearchBar() {
    searchBar.delegate = self
  }
}

// MARK: - RepositorySearchingViewInput

extension RepositorySearchingViewController: RepositorySearchingViewInput {
  func update(source: [RepositoryModel]) {
    dataDisplayManager.update(source: source)
  }
}

// MARK: - UISearchBarDelegate

extension RepositorySearchingViewController: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.trimmingCharacters(in: CharacterSet(charactersIn: " ")).isEmpty { return }
    output.searchRepositoryNamed(searchText, onPage: 1, isPagingEnable: false)
  }
}

//MARK: - RepositorySearchingDataDisplayManagerOutput

extension RepositorySearchingViewController: RepositorySearchingDataDisplayManagerOutput {
  func didSelect(repository: RepositoryModel) {
    output.obtainSelected(repository: repository)
  }
  
  func loadNewPortionFrom(page: Int) {
    guard let repositoryName = searchBar.text else { return }
    output.searchRepositoryNamed(repositoryName, onPage: page, isPagingEnable: true)
  }
}

//MARK: - UIViewControllerTransitioningDelegate

extension RepositorySearchingViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PresentAnimationController()
  }
}

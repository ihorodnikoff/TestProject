//
//  RepositorySearchingDataDisplayManager.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

class RepositorySearchingDataDisplayManager: NSObject {
  
  struct C {
    static let rowHeight: CGFloat = 60
    static let defaultItemsCount: Int = 15
  }
  
  //MARK: - Injected
  
  weak var output: RepositorySearchingDataDisplayManagerOutput?
  var tableView: UITableView?
  
  //MARK: - Properties
  
  private var source = [RepositoryModel]()
  private var pageNumbers: Int {
    return Int(round(Double(source.count) / Double(C.defaultItemsCount)))
  }
  private var isUpdating = false
  
}

extension RepositorySearchingDataDisplayManager: RepositorySearchingDataDisplayManagerInput {
  func configure(with tableView: UITableView) {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.rowHeight = C.rowHeight
    tableView.registerNib(SearchingResultCell.self)
    
    self.tableView = tableView
  }
  
  func update(source: [RepositoryModel]) {
    self.source = source
    tableView?.reloadData()
    isUpdating = false
  }
}

extension RepositorySearchingDataDisplayManager: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return source.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: SearchingResultCell = tableView.dequeueReusableCell(for: indexPath)
    cell.update(with: RepositoryViewModel(model: source[indexPath.row]))
    return cell
  }
  
}

extension RepositorySearchingDataDisplayManager: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    var repository = source[indexPath.row]
    repository.isViewed = true
    output?.didSelect(repository: repository)
    guard let cell = tableView.cellForRow(at: indexPath) as? SearchingResultCell else { return }
    cell.update(with: RepositoryViewModel(model: repository))
  }
  
}

extension RepositorySearchingDataDisplayManager: UIScrollViewDelegate {
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if isUpdating { return }
    if scrollView.contentOffset.y + scrollView.frame.size.height > scrollView.contentSize.height - 5 * C.rowHeight {
      output?.loadNewPortionFrom(page: pageNumbers + 1)
    }
  }
}

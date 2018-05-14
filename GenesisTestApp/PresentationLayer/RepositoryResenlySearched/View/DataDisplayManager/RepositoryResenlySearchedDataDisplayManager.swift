//
//  RepositoryResenlySearchedDataDisplayManager.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/14/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

final class RepositoryResenlySearchedDataDisplayManager: NSObject {
  
  struct C {
    static let rowHeight: CGFloat = 60
  }
  
  weak var output: RepositoryResenlySearchedDataDisplayManagerOutput?
  private var tableView: UITableView?
  private var source = [RepositoryModel]()
  
}

extension RepositoryResenlySearchedDataDisplayManager: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return source.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: SearchingResultCell = tableView.dequeueReusableCell(for: indexPath)
    cell.update(with: RepositoryViewModel(model: source[indexPath.row]))
    return cell
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      source.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
      output?.configure(results: source)
    }
  }
  
}

extension RepositoryResenlySearchedDataDisplayManager: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }

  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let movedObject = source[sourceIndexPath.row]
    source.remove(at: sourceIndexPath.row)
    source.insert(movedObject, at: destinationIndexPath.row)
    output?.configure(results: source)
  }
}

extension RepositoryResenlySearchedDataDisplayManager: RepositoryResenlySearchedDataDisplayManagerInput {
  func applyEditingStyle() {
    tableView?.isEditing = true
  }
  
  func applyDefaultStyle() {
    tableView?.isEditing = false
  }
  
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
  }
}

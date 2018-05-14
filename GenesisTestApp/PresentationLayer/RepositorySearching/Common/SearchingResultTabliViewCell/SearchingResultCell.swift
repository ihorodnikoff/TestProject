//
//  SearchingResultCell.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/13/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import UIKit

class SearchingResultCell: UITableViewCell {
    
  @IBOutlet weak var starsNumber: UILabel!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var viewed: UILabel!
  
}

extension SearchingResultCell: NibLoadableView {}

extension SearchingResultCell: ModelTransfer {
  func update(with model: RepositoryViewModel) {
    starsNumber.text = "\(model.starsNumber)"
    name.text = model.name
    viewed.isHidden = !model.isViewed
  }
}

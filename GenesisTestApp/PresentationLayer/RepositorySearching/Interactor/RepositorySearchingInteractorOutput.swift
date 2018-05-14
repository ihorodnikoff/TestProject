//
//  RepositorySearchingInteractorOutput.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//

import Foundation

protocol RepositorySearchingInteractorOutput: class {
  func obtainRepositories(_ repositories: [RepositoryModel])
}

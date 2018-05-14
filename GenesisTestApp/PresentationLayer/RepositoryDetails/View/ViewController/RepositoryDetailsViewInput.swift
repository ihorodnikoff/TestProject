//
//  RepositoryDetailsViewInput.swift
//  Rentberry
//
//  Created by i.horodnikov on 13/05/2018.
//  Copyright © 2018 Rentberry. All rights reserved.
//
import Foundation

protocol RepositoryDetailsViewInput: class {
  func configure(with url: URL)
  func dismiss()
}

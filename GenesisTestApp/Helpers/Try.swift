//
//  Try.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation

typealias TryEmpty = Try<()>

enum Try<T> {
  case success(T)
  case failure(Error)
  
  init(_ factory: () throws -> T) {
    do {
      self = .success(try factory())
    } catch {
      self = .failure(error)
    }
  }
  
  init(_ value: T) {
    self = .success(value)
  }
  
  init(_ error: Error) {
    self = .failure(error)
  }
  
  init(_ optional: T?, else factory: @autoclosure () -> Error) {
    if let t = optional {
      self = .success(t)
    } else {
      self = .failure(factory())
    }
  }
  
  func flatMap<U>(_ transform: (T) -> Try<U>) -> Try<U> {
    switch self {
    case .success(let t):
      return transform(t)
    case .failure(let error):
      return .failure(error)
    }
  }
  
}

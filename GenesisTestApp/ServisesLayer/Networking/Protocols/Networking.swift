//
//  Networking.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation
import Moya
import Alamofire

protocol Networking {
  
  func request(target: GitHubApi, completion: @escaping (Try<Response>) -> Void)
  
}

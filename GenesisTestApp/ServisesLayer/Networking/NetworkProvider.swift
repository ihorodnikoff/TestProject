//
//  NetworkProvider.swift
//  GenesisTestApp
//
//  Created by Igor Gorodnikov on 5/12/18.
//  Copyright © 2018 iGor. All rights reserved.
//

import Foundation
import Moya
import Alamofire

class NetworkProvider {
  
  lazy var defaultProvider: MoyaProvider<GitHubApi> = {
    let logger = NetworkLoggerPlugin()
    let networkActivity = NetworkActivityPlugin(networkActivityClosure: { (state, _) in
      UIApplication.shared.isNetworkActivityIndicatorVisible = state == .began
    })
    var plugins = [PluginType]()
    plugins.append(networkActivity)
    #if DEBUG
      plugins.append(logger)
    #endif
    
    return MoyaProvider(manager: defaultAlamofireManager(),
                        plugins: plugins)
  }()
  
  private func defaultAlamofireManager() -> Alamofire.SessionManager {
    let timeOut: TimeInterval = 20
    let sessionManager: Alamofire.SessionManager = {
      let configuration = URLSessionConfiguration.default
      configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
      configuration.timeoutIntervalForRequest = timeOut
      configuration.timeoutIntervalForResource = timeOut
      configuration.requestCachePolicy = .useProtocolCachePolicy
      
      return Alamofire.SessionManager(configuration: configuration)
    }()
   return sessionManager
  }
  
}

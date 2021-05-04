//
//  Statera+Api.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import Foundation
import Moya

extension Statera {
  enum Api {
    case fetchTransactions
  }
}

extension Statera.Api: TargetType {
  var baseURL: URL {
    return URL(string: Statera.BaseUrl)!
  }
  
  var path: String {
    switch self {
    case .fetchTransactions:
      return "/transactions"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .fetchTransactions:
      return .get
    }
  }
  
  var sampleData: Data {
    Data()
  }
  
  var task: Task {
    switch self {
    case .fetchTransactions:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    nil
  }
}

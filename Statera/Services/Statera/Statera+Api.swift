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
    switch self {
    case .fetchTransactions:
      return "[{\"id\":\"1\",\"transactionDate\":\"2021-02-02T08:11:16+13:00\",\"summary\":\"Fancy Food Market Auckland\",\"debit\":197.9,\"credit\":0}]".dataEncoded
    }
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

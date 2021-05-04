//
//  StateraApiService.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import Foundation
import RxSwift
import Moya

extension Statera {
  class ApiService {
    static let shared: ApiService = ApiService()
    
    var plugins: [PluginType] = []
    
    private let provider: MoyaProvider<Statera.Api>
    
    fileprivate init() {
      #if DEBUG
      var config = NetworkLoggerPlugin.Configuration()
      config.logOptions = .verbose
      config.formatter.responseData = JsonSerializationDataFormatter
      plugins.append(NetworkLoggerPlugin(configuration: config))
      #endif
      
      #if TESTING
      provider = MoyaProvider<Statera.Api>(stubClosure: MoyaProvider.immediatelyStub, plugins: plugins)
      #else
      provider = MoyaProvider<Statera.Api>(plugins: plugins)
      #endif
    }
    
    func getTransactions() -> Observable<[Transaction]> {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .formatted(formatter)
      return provider.rx
        .request(Statera.Api.fetchTransactions)
        .map([Transaction].self, using: decoder)
        .asObservable()
    }
  }
}

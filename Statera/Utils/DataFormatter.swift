//
//  DataFormatter.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import Foundation

func JsonSerializationDataFormatter(_ data: Data) -> String {
  do {
    let dataAsJson = try JSONSerialization.jsonObject(with: data)
    let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJson, options: .prettyPrinted)
    if let str = String(data: prettyData, encoding: .utf8) {
      return str
    }
    return ""
  } catch {
    return ""
  }
}

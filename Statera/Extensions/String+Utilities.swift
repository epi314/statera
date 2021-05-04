//
//  String+Utilities.swift
//  Statera
//
//  Created by Pierre Enriquez on 5/05/21.
//

import Foundation

extension String {
  var dataEncoded: Data {
    return self.data(using: String.Encoding.utf8)!
  }
}

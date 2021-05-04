//
//  Transaction.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import Foundation

struct Transaction {
  let id: String
  let transactionDate: Date
  let summary: String
  let debit: Double
  let credit: Double
  
  var gst: Double {
    let value = debit > 0 ? debit : credit
    return value - (value / 1.15)
  }
}

extension Transaction: Codable {}

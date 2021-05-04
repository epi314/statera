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
}

extension Transaction: Codable {}

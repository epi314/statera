//
//  TransactionsListPresenter.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import Foundation

protocol TransactionsListPresentable: class {
  var view: TransactionsListPresenting? { get set }
  
  // MARK: VIEW -> PRESENTER
  func getTransactions()
}

protocol TransactionsListPresenting: class {
  var presenter: TransactionsListPresentable? { get set }
  
  // MARK: PRESENTER -> VIEW
  func display(transactions: [Any])
}

class TransactionsListPresenter {
  weak var view: TransactionsListPresenting?
  
  static func configure(view: TransactionsListPresenting) {
    let presenter: TransactionsListPresentable = TransactionsListPresenter()
    presenter.view = view
    view.presenter = presenter
  }
}

// MARK: Make presentable
extension TransactionsListPresenter: TransactionsListPresentable {
  func getTransactions() {
    // fetch transactions here
  }
}

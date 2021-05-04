//
//  TransactionDetailsPresenter.swift
//  Statera
//
//  Created by Pierre Enriquez on 5/05/21.
//

import Foundation

protocol TransactionDetailsPresentable: class {
  var view: TransactionDetailsPresenting? { get set }
  
  // MARK: VIEW -> PRESENTER
}

protocol TransactionDetailsPresenting: class {
  var presenter: TransactionDetailsPresentable? { get set }
  
  // MARK: PRESENTER -> VIEW
}

class TransactionDetailsPresenter {
  weak var view: TransactionDetailsPresenting?
  
  
  static func configure(view: TransactionDetailsPresenting) {
    let presenter: TransactionDetailsPresentable = TransactionDetailsPresenter()
    presenter.view = view
    view.presenter = presenter
  }
}

// MARK: Make presentable
extension TransactionDetailsPresenter: TransactionDetailsPresentable {
}


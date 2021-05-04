//
//  TransactionsListPresenter.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import Foundation
import RxSwift

protocol TransactionsListPresentable: class {
  var view: TransactionsListPresenting? { get set }
  
  // MARK: VIEW -> PRESENTER
  func getTransactions()
}

protocol TransactionsListPresenting: class {
  var presenter: TransactionsListPresentable? { get set }
  
  // MARK: PRESENTER -> VIEW
  func display(transactions: [Transaction])
}

class TransactionsListPresenter {
  weak var view: TransactionsListPresenting?
  
  private var disposeBag = DisposeBag()
  
  static func configure(view: TransactionsListPresenting) {
    let presenter: TransactionsListPresentable = TransactionsListPresenter()
    presenter.view = view
    view.presenter = presenter
  }
}

// MARK: Make presentable
extension TransactionsListPresenter: TransactionsListPresentable {
  func getTransactions() {
    Statera.ApiService.shared.getTransactions()
      .subscribe { event in
        switch event {
        case .next(let transactions):
          self.view?.display(transactions: transactions)
        case .error(let error):
          // handle error here
          ()
        default:
          ()
        }
      }
      .disposed(by: disposeBag)
  }
}

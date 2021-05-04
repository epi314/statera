//
//  TransactionsListViewController.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import UIKit

class TransactionsListViewController: UITableViewController {
  var presenter: TransactionsListPresentable?

  override func viewDidLoad() {
    super.viewDidLoad()

  }
}

extension TransactionsListViewController: TransactionsListPresenting {
  
  func display(transactions: [Any]) {
  }
}

//
//  TransactionsListViewController.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import UIKit

class TransactionsListViewController: UITableViewController {
  var presenter: TransactionsListPresentable?
  
  private var transactions: [Transaction] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    
    presenter?.getTransactions()
  }
}

extension TransactionsListViewController: TransactionsListPresenting {
  
  func display(transactions: [Transaction]) {
    self.transactions = transactions
        
    tableView.reloadData()
  }
}

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
  
  private let transactionCellId = "transactionCellId"

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    
    presenter?.getTransactions()
  }
}

// MARK: Private functions
private extension TransactionsListViewController {
  func setupView() {
    title = "Transactions"
    
    tableView.separatorInset = UIEdgeInsets.zero
    
    tableView.tableFooterView = UIView()
    tableView.register(TransactionCell.self, forCellReuseIdentifier: transactionCellId)
  }
}

// MARK: - UITableViewDelegate
extension TransactionsListViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

// MARK: - UITableViewDataSource
extension TransactionsListViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return transactions.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: transactionCellId, for: indexPath) as? TransactionCell else { return TransactionCell()}
    
    cell.summary = self.transactions[indexPath.row].summary
    let credit = self.transactions[indexPath.row].credit
    let debit = self.transactions[indexPath.row].debit
    cell.amount = credit > 0 ? credit : -debit
          
    return cell
  }
}

extension TransactionsListViewController: TransactionsListPresenting {
  
  func display(transactions: [Transaction]) {
    self.transactions = transactions
        
    tableView.reloadData()
  }
}

//
//  TransactionDetailsViewController.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import UIKit

class TransactionDetailsViewController: UIViewController {
  var presenter: TransactionDetailsPresentable?
  
  var transaction: Transaction? {
    didSet {
      if let transaction = transaction {
        summaryLabel.text = "Summary: \(transaction.summary)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mma E, d MMM y"
        dateLabel.text = "Transaction Date: \(formatter.string(from: transaction.transactionDate))"
        
        creditDebitLabel.textColor = transaction.credit > 0 ? .green : .red
        creditDebitLabel.text = transaction.credit > 0 ? "CR: \(String(format: "%.2f", transaction.credit))" : "DR: \(String(format: "%.2f", transaction.debit))"
                
        gstLabel.text = "GST: \(String(format: "%.2f", transaction.gst))"
      }
    }
  }
  
  lazy var summaryLabel: UILabel = {
    let l = UILabel()
    return l
  }()
  
  lazy var dateLabel: UILabel = {
    let l = UILabel()
    return l
  }()
  
  lazy var creditDebitLabel: UILabel = {
    let l = UILabel()
    return l
  }()
    
  lazy var gstLabel: UILabel = {
    let l = UILabel()
    return l
  }()
  
  lazy var date: UILabel = {
    let l = UILabel()
    return l
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
}

// MARK: Private functions
private extension TransactionDetailsViewController {
  func setupView() {
    title = "Details"
    
    view.backgroundColor = .white
    
    view.addSubview(summaryLabel)
    summaryLabel.align(top: view.safeAreaLayoutGuide.topAnchor, lead: view.leadingAnchor, bottom: nil, trail: view.trailingAnchor, topPadding: 10, leadPadding: 20, bottomPadding: 0, trailPadding: 20)
    
    view.addSubview(dateLabel)
    dateLabel.align(top: summaryLabel.bottomAnchor, lead: view.leadingAnchor, bottom: nil, trail: view.trailingAnchor, topPadding: 10, leadPadding: 20, bottomPadding: 0, trailPadding: 20)
    
    view.addSubview(creditDebitLabel)
    creditDebitLabel.align(top: dateLabel.bottomAnchor, lead: view.leadingAnchor, bottom: nil, trail: view.trailingAnchor, topPadding: 10, leadPadding: 20, bottomPadding: 0, trailPadding: 20)
        
    view.addSubview(gstLabel)
    gstLabel.align(top: creditDebitLabel.bottomAnchor, lead: view.leadingAnchor, bottom: nil, trail: view.trailingAnchor, topPadding: 10, leadPadding: 20, bottomPadding: 0, trailPadding: 20)
  }
}

// MARK: - Make presenting
extension TransactionDetailsViewController: TransactionDetailsPresenting {
}

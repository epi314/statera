//
//  TransactionCell.swift
//  Statera
//
//  Created by Pierre Enriquez on 4/05/21.
//

import UIKit

class TransactionCell: UITableViewCell {
  var summary: String? {
    didSet {
      summaryLabel.text = summary
    }
  }
  
  var amount: Double? {
    didSet {
      if let amount = amount {
        amountLabel.textColor = amount > 0 ? .green : .red
        amountLabel.text = String(format: "%.2f", abs(amount))
      }
    }
  }
  
  private lazy var summaryLabel: UILabel = {
    let l = UILabel()
    return l
  }()
  
  private lazy var amountLabel: UILabel = {
    let l = UILabel()
    return l
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    
    setupView()
  }
}

// MARK: Private functions
private extension TransactionCell {
  func setupView() {
    addSubview(summaryLabel)
    summaryLabel.align(top: topAnchor, lead: leadingAnchor, bottom: nil, trail: trailingAnchor, topPadding: 10, leadPadding: 20, bottomPadding: 0, trailPadding: 20)
    
    addSubview(amountLabel)
    amountLabel.align(top: summaryLabel.bottomAnchor, lead: leadingAnchor, bottom: bottomAnchor, trail: trailingAnchor, topPadding: 10, leadPadding: 20, bottomPadding: 10, trailPadding: 20)
    
  }
}

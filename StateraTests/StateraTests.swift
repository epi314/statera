//
//  StateraTests.swift
//  StateraTests
//
//  Created by Pierre Enriquez on 4/05/21.
//

import XCTest
import RxSwift
@testable import Statera

class StateraTests: XCTestCase {
  
  override func setUpWithError() throws {
  }

  override func tearDownWithError() throws {
  }

  func testTransaction() throws {
    let transaction = Transaction(id: "1", transactionDate: Date(), summary: "Test Summary", debit: 0.0, credit: 12.0)
    
    XCTAssertEqual(transaction.gst, 12.0 - 12.0/1.15, "Computed GST is wrong!")
  }
  
  func testFetchTransactions() throws {
    Statera.ApiService.shared.getTransactions()
      .subscribe { event in
        switch event {
        case .next(let transactions):
          XCTAssertEqual(transactions.count, 1, "Should only have one transaction")
          XCTAssertEqual(transactions[0].id, "1", "Transaction ID should be \"1\"")
          
        case .error(let error):
          // handle error here
          ()
        default:
          ()
        }
      }
      .disposed(by: DisposeBag())
  }

  func testPerformanceExample() throws {
    self.measure {
    }
  }

}

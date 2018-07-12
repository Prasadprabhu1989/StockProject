//
//  StockProjectTests.swift
//  StockProjectTests
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import XCTest
@testable import StockProject

class StockProjectTests: XCTestCase {
    let stockListController = StockListController()
    let stockDetailController = StockDetailViewController()
    
    
    override func setUp() {
        super.setUp()
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func test_FetchStocks(){
        stockListController.viewModel.loadStocks { results in
            XCTAssertNotNil(results,"The Results are not nil")
        }
    }
    func test_FetchDetailStocks(){
        let symbol = "FB"
        stockDetailController.viewModel.loadStockDetails(symbols: symbol) { results in
            XCTAssertNotNil(results?.stockModel , "The results are not nil")
        }
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

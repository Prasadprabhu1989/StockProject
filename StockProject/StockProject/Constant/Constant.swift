//
//  Constant.swift
//  StockProject
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation


struct Constant {
    static let stockList = ""
    static let stockListIdentifier = "StockListId"
    static let API_KEY = "2SMUEF5ZDLLLJEYK"
    static let BASE_URL = "https://www.alphavantage.co/query"
    static let Function = "function"
    static let batchStockQuotes = "BATCH_STOCK_QUOTES"
    static let timeSeries = "TIME_SERIES_DAILY"
    static let symbols = "symbols"
    static let apikey = "apikey"
    static let stockSegue = "StockDetail"
    static let detailSymbol = "symbol"
}
struct Keys {
     static let metaData = "Meta Data"
     static let lastRefreshed = "3. Last Refreshed"
    static let timeSeries = "Time Series (Daily)"
    static let open = "1. open"
    static let high = "2. high"
    static let low = "3. low"
    static let close = "4. close"
    static let volume = "5. volume"
}
struct Errors {
    static let networkError = "There is connectivity issue"
}

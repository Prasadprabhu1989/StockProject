//
//  Stocks.swift
//  StockProject
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
struct stock: Decodable {
    let stocks : [stockQuotes]?
    private enum CodingKeys : String, CodingKey {
        case stocks = "Stock Quotes"
        
    }
}
struct stockQuotes : Decodable{
    let symbol : String?
    let price : String?
    let timeStamp : String?
    
    private enum CodingKeys : String, CodingKey {
        case symbol = "1. symbol"
        case price = "2. price"
        case timeStamp = "4. timestamp"
    }
    
}


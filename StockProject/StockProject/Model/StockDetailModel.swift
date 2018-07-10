//
//  StockDetailModel.swift
//  StockProject
//
//  Created by Prasad Prabhu on 10/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
struct StockDetailModel : Decodable{
    var TimeSeries : [TimeSeries]?
    private enum CodingKeys : String,CodingKeys{
        case TimeSeries = "Time Series (Daily)"
    }
}
struct TimeSeries : Decodable{
    var date : Type
    private enum CodingKeys : String, CodingKey{
        case type = "
    }
}
struct Type : Decodable {
    let open : String?
    let high : String?
     let low : String?
     let close : String?
     let volume : String?
    private enum CodingKeys : String, CodingKey {
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
        
    }
    
}

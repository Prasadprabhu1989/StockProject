//
//  StockDetailModel.swift
//  StockProject
//
//  Created by Prasad Prabhu on 10/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
struct MetaDataModel : Decodable{
//    var TimeSeries : [TimeSeries]?
    var metaData : MetaData?
  
    
    private enum CodingKeys : String, CodingKey{
//        case TimeSeries = "Time Series (Daily)"
        case metaData = "Meta Data"
    }
    
    
}
struct StockDetailModel : Decodable {
     var TimeSeries : [TimeSeries]?
//    var timeStamp : String?

    private enum CodingKeys : String, CodingKey{
    case TimeSeries = "Time Series (Daily)"

    }
    
}
struct TimeSeries : Decodable{
    var date : Type?
//    var timeStamp : String?
    private static var timeStamp : String{
        return UserDefaults.standard.string(forKey: "TimeStamp")!
    }
//    private enum CodingKeys : String, CodingKey{
//        case date = "ded"
//    }
    
}
struct MetaData : Decodable {
    var information: String?
    var symbol : String?
    var lastRefresh : String?
    var outPutSize : String?
    var timeZone : String?
    private enum CodingKeys : String, CodingKey{
        case information = "1. Information"
        case symbol = "2. Symbol"
        case lastRefresh = "3. Last Refreshed"
        case outPutSize = "4. Output Size"
        case timeZone = "5. Time Zone"
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

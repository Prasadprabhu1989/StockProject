//
//  StockDetailModel.swift
//  StockProject
//
//  Created by Prasad Prabhu on 10/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
import SwiftyJSON

struct StockDetailModel : Decodable {
    var open : String?
    var high : String?
    var low : String?
    var close : String?
    var volume : String?
    init(json: JSON) {
        let date = json[Keys.metaData][Keys.lastRefreshed].string
        let dateString = String.trimTimeFromDate(date: date!)
        open = json[Keys.timeSeries][dateString][Keys.open].string
        high = json[Keys.timeSeries][dateString][Keys.high].string
        low = json[Keys.timeSeries][dateString][Keys.low].string
        close = json[Keys.timeSeries][dateString][Keys.close].string
        volume = json[Keys.timeSeries][dateString][Keys.volume].string
    }
    
}


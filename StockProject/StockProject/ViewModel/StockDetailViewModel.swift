//
//  StockDetailViewModel.swift
//  StockProject
//
//  Created by Prasad.d on 10/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
import SwiftyJSON
class StockDetailViewModel{
     var responseError : Error?
    var stockModel : StockDetailModel?
    var open : String?
    var close : String?
    var volume : String?
    var low : String?
    var high : String?
    
    func loadStockDetails(symbols : String, completion : @escaping (StockDetailViewModel?) -> Void)
    {
        APIClient.loadStockDetails(symbols: symbols) { [weak self](data, error) in
            if let responseData = data {
                do {
               
                    let json = try JSON(data: responseData)
                   
                   let stockDetailModel = StockDetailModel(json: json)
                    self?.stockModel = stockDetailModel
                    
                    completion(self)
                    
                }
                catch {
                    
                }
            }
            if let err = error {
                self?.responseError = err
                
                completion(self)
            }
        }
    }
    func getOpenStock() -> String?{
        return "\(self.stockModel?.open)"
//        return "Open :\(String(describing: self.stockModel?.open))"
    }
    func getCloseStock() -> String?{
        return "Close :\(String(describing: self.stockModel?.close))"
    }
    func getLowStock() -> String?{
        return "Low :\(String(describing: self.stockModel?.low))"
    }
    func getHighStock() -> String?{
        return "High :\(String(describing: self.stockModel?.high))"
    }
    func getVolumeStock() -> String?{
        return "Volume :\(String(describing: self.stockModel?.volume))"
    }
}


extension String{
    static func trimTimeFromDate(date: String) -> String {
        var dateString = date
        let range = dateString.index(dateString.endIndex, offsetBy: -9)..<dateString.endIndex
        dateString.removeSubrange(range)
        return dateString
        
        
    }
}

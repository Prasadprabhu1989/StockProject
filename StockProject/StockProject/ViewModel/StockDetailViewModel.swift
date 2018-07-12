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

        if let stockModel = self.stockModel {
        
            
            return "Open :\(stockModel.open ?? "")"
        }
        return nil
      
    }
    func getCloseStock() -> String?{
        if let stockModel = self.stockModel {
            return "Close :\(stockModel.close ?? "")"
        }
        return nil
    }
    func getLowStock() -> String?{
        if let stockModel = self.stockModel {
            return "Low : \(stockModel.low ?? "")"
        }
        return nil
    }
    func getHighStock() -> String?{
        if let stockModel = self.stockModel {
            return "High : \(stockModel.high ?? "")"
        }
        return nil
    }
    func getVolumeStock() -> String?{
        if let stockModel = self.stockModel {
            return "Volume : \(stockModel.volume ?? "")"
        }
        return nil
    }
}


extension String{
    static func trimTimeFromDate(date: String) -> String {
        var dateString = date
        if dateString.count == 10 {
            return dateString
        }
        let range = dateString.index(dateString.endIndex, offsetBy: -9)..<dateString.endIndex
        dateString.removeSubrange(range)
        return dateString
        
        
    }
}

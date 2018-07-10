//
//  StockViewModel.swift
//  StockProject
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
import Alamofire
class StockViewModel {
    var stocks : stock?
    var responseError : Error?
    
    func getStockCount() -> Int{
        if let rows =  stocks?.stocks {
            return rows.count
        }
        
        return 0
    }
    func loadStocks(completion :@escaping (StockViewModel?)->Void) {
        APIClient.loadStocks { [weak self](data, error) in
            
            if let responseData = data {
                do {
                    self?.stocks = try JSONDecoder().decode(stock.self, from: responseData)
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
   
}

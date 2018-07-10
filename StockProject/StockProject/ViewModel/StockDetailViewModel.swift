//
//  StockDetailViewModel.swift
//  StockProject
//
//  Created by Prasad.d on 10/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
class StockDetailViewModel{
     var responseError : Error?
    func loadStockDetails(symbols : String, completion : @escaping (StockDetailViewModel?) -> Void)
    {
        APIClient.loadStockDetails(symbols: symbols) { [weak self](data, error) in
            if let responseData = data {
                do {
                    
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

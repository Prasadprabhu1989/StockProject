//
//  StockDetailViewModel.swift
//  StockProject
//
//  Created by Prasad.d on 10/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
class StockDetailViewModel{
    func loadStockDetails(symbols : String, completion : (StockDetailViewModel?) -> Void)
    {
        APIClient.loadStockDetails(symbols: symbols) { (data, error) in
            
        }
    }
}

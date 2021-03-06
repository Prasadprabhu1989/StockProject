//
//  APIClient.swift
//  StockProject
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class APIClient {
    static func loadStocks(completion :  @escaping(_ Data : Data?, _ error :Error?) -> Void) {
        Alamofire.request(APIRouter.stocks).responseData { response in
            switch response.result {
            case .success(let results):
                completion(results, nil)
                
            case .failure(let error):
                completion(nil , error)
            }
        }

    }
    static func loadStockDetails(symbols : String,completion : @escaping (_ jsonData : Data? , _ error : Error?)->Void){


        Alamofire.request(APIRouter.stockDetail(symbols: symbols)).responseJSON { response in
                        switch response.result {
                        case .success(let results):

                            completion(response.data,nil)
                            
            
                        case .failure(let error):
                            completion(nil , error)
                        }
                    }
    }
}

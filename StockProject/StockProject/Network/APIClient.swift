//
//  APIClient.swift
//  StockProject
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
import Alamofire
class APIClient {
    static func loadStocks(completion :  @escaping(_ Data : Data?, _ error :Error?) -> Void) {
        Alamofire.request(APIRouter.stocks).responseJSON { response in
            switch response.result {
            case .success(let results):
                completion(results as? Data , nil)
                
            case .failure(let error):
                completion(nil , error)
            }
        }
    }
}

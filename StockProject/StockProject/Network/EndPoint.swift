//
//  EndPoint.swift
//  StockProject
//
//  Created by Prasad.d on 09/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
import Alamofire
protocol APIConfiguration : URLRequestConvertible {
    var method : HTTPMethod { get }
    var path : String? { get }
    var parameters : Parameters? {get}
}
enum APIRouter : APIConfiguration {

    case stocks
    case stockDetail(symbols : String)
    func asURLRequest() throws -> URLRequest {
        let url = Constant.BASE_URL
        var urlRequest = URLRequest(url: URL(string: url)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 30.0)
        urlRequest.httpMethod = method.rawValue
      
        return try URLEncoding.default.encode(urlRequest, with: parameters)
            
      
        
    }
    var path : String?{
        switch self {
        case .stocks, .stockDetail:
            return nil
        }
    }
    var method: HTTPMethod{
        return .get
    }
   
    var parameters: Parameters?{
        switch self {
        case .stocks:
            return [Constant.API_KEY : Constant.apikey,Constant.Function :Constant.batchStockQuotes,Constant.symbols : "MSFT,FB,AAPL,NDAQ"]
        case .stockDetail(let symbols):
            return [Constant.API_KEY : Constant.apikey,Constant.symbols : symbols]
        }
    }

}

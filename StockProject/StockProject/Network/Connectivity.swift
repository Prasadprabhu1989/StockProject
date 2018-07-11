//
//  Connectivity.swift
//  StockProject
//
//  Created by Prasad Prabhu on 11/07/18.
//  Copyright © 2018 Prasad.d. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity{
    class func isConnected() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

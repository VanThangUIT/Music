//
//  NetworkManager.swift
//  Music
//
//  Created by Nguyen Van Thang on 07/03/2022.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

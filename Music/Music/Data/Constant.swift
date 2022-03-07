//
//  Constant.swift
//  Music
//
//  Created by Nguyen Van Thang on 23/02/2022.
//

import Foundation

class Constant {
    static let clientID = "4f0ff6d25ecf4f97917c70fa32713c6c"
    static let clientSecret = "0833d2aaf2374b55b6804a095bce80d2"
    static let scope = "user-read-private"
    static let baseURL = "https://accounts.spotify.com/authorize"
    static let redirectURL = "https://github.com/VanThangUIT/Music"
    
    
    static var signInURL: URL? {
        let urlString = "\(baseURL)?response_type=code&client_id=\(clientID)&scope=\(scope)&redirect_uri=\(redirectURL)&show_dialog=TRUE"
        return URL(string: urlString)
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case accessToken = "access-token"
        case client = "client"
        case tokenType = "token-type"
        case uid = "uid"
        case expiry = "expiry"
        case deviceId = "device-id"
        case deviceOsType = "device-os-type"
        case token  = "tokens"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
        case authorization
        case form = "application/x-www-form-urlencoded"
        
        var contentType: String {
            switch self {
            case .authorization:
                let basicToken = Constant.clientID + ":" + Constant.clientSecret
                guard let base64String = basicToken.data(using: .utf8)?.base64EncodedString() else {
                    assert(true)
                    return ""
                }
                
                return "Basic " + base64String
            case .json, .form:
                return self.rawValue
            }
        }
    }
    
    class func toHeaders() -> [String: String] {
        let token = AppDefault.share.token
        let sessionId = AppDefault.share.sessionId
        
        if !token.isEmpty {
            return ["Authorization": "Bearer \(token)"]
        }
        
        return ["X-Session-Id": sessionId]
    }
    
}

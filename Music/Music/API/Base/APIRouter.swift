//
//  APIRouter.swift
//  Music
//
//  Created by Nguyen Van Thang on 28/02/2022.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    // The enpoint name
    case fetchToken(params: FetchTokenParam)
    
    // MARK: - BaseURL
    private var baseURL: URL {
        switch self {
        case .fetchToken:
            return APIConfig.shared.apiToken
        }
    }
    
    // MARK: - Path
    // The path following base url
    private var path: String {
        switch self {
        case .fetchToken:
            return ""
        }
    }
    
    // MARK: - Method
    private var method: HTTPMethod {
        switch self {
        case .fetchToken:
            return .post
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .fetchToken(let params):
            return params.toParams()
        }
    }
    
    // MARK: - Body
    private var body: Data? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        
        // http Method
        urlRequest.httpMethod = method.rawValue
        
        // Common headers
        urlRequest.addValue(Constant.ContentType.authorization.contentType, forHTTPHeaderField: Constant.HttpHeaderField.authentication.rawValue)
        urlRequest.addValue(Constant.ContentType.form.contentType, forHTTPHeaderField: Constant.HttpHeaderField.contentType.rawValue)
        
        // Custom headers
        /*switch self {
        case .fetchToken:
            urlRequest.addValue(Constant.ContentType.form.rawValue, forHTTPHeaderField: Constant.HttpHeaderField.)
        }*/
        
        // Endcoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            case .post:
                return URLEncoding.httpBody
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameters)
    }
}

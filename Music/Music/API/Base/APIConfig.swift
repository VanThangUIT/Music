//
//  APIConfig.swift
//  Music
//
//  Created by Nguyen Van Thang on 28/02/2022.
//

import Foundation

struct APIConfig {
    
    private static var _shared: APIConfig = APIConfig.staging
    
    static let staging: APIConfig = APIConfig(
        root: URL(string: "https://accounts.spotify.com/api/token")!,
        apiToken: URL(string: "https://accounts.spotify.com/api/token")!
    )
    
    static let production: APIConfig = APIConfig(
        root: URL(string: "https://accounts.spotify.com/api/token")!,
        apiToken: URL(string: "https://accounts.spotify.com/api/token")!
    )
    
    static let develop: APIConfig = APIConfig(
        root: URL(string: "https://accounts.spotify.com/api/token")!,
        apiToken: URL(string: "https://accounts.spotify.com/api/token")!
    )
    
    static var shared: APIConfig {
        return self._shared
    }
    
    static func setShared(_ config: APIConfig) {
        self._shared = config
    }
    
    let root: URL
    let apiToken: URL
}

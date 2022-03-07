//
//  TokenResponse.swift
//  Music
//
//  Created by Nguyen Van Thang on 07/03/2022.
//

import Foundation

struct TokenResponse: Codable {
    var access_token: String?
    var token_type: String?
    var scope: String?
    var expires_in: Int?
    var refresh_token: String?
}

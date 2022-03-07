//
//  APIError.swift
//  Music
//
//  Created by Nguyen Van Thang on 28/02/2022.
//

import Foundation

enum ApiError: Error {
    case unAuthorized           //Status code 401
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case alreadyTaken           //Status code 422
    case internalServerError    //Status code 500
    case requestEntityTooLarge  //Status code 413
    case deleteSuccess          //Status code 204 - special case
    case locationOutOfRange     //status code 400 with message
}

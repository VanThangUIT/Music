//
//  FetchTokenParam.swift
//  Music
//
//  Created by Nguyen Van Thang on 07/03/2022.
//

import Foundation

struct FetchTokenParam {
    func toParams() -> [String: Any] {
        return  [
            "grant_type": "authorization_code",
            "code": AppDefault.share.code,
            "redirect_uri": Constant.redirectURL
         ]
    }
}

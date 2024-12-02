//
//  LoginModel.swift
//  Kream
//
//  Created by 김연우 on 9/24/24.
//

import Foundation

struct LoginUser {
    let email: String
    let password: String
}

struct LoginModel: Codable {
    let accessToken: String
    let refreshToken: String
    let expiresIn: Int
    let scope: String
    let tokenType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case scope
        case tokenType = "token_type"
    }
}

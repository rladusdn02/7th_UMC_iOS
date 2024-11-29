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
var users: [LoginUser] = [
    LoginUser(email: "admin@kream.com", password: "admin")
]

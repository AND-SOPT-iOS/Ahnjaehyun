//
//  DTO.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/8/24.
//

import Foundation


struct RegisterRequest: Codable {
  let username: String
  let password: String
  let hobby: String
}


struct LoginResponse: Codable {
    let token: String
}

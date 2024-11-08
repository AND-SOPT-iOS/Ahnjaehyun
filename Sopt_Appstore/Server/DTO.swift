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

// 로그인 시 토큰 반환
struct LoginResponse: Codable {
    let token: String
}


// 취미 조회 결과
struct HobbyResponse: Codable {
    let hobby: String
}

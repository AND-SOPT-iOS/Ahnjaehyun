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
    struct Result: Codable {
        let token: String
    }
    
    let result: Result
}

// 취미 조회 결과
struct HobbyResponse: Codable {
    struct Result: Codable {
        
        let hobby: String
    }
    let result: Result
    
}

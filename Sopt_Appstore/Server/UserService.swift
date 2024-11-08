//
//  UserService.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/8/24.
//

import Foundation
import KeychainSwift
import Alamofire



class UserService {
    
    func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        
        let url = Environment.baseURL + "/user"
        
        let parameters = RegisterRequest(
            username: username,
            password: password,
            hobby: hobby
        )
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self
            else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(true))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    /// 로그인 API 메서드
    func login(username: String, password: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/login"
        
        
        let parameters: [String: String] = ["username": username, "password": password]
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .responseDecodable(of: LoginResponse.self) { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self = self else {
                completion(.failure(.unknownError))
                return
            }
            
            
            switch response.result {
                
            case .success(let loginResponse):
                completion(.success(loginResponse.result.token))
                
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
            
        }
    }
    
    
    /// 내 취미 조회 메서드 추가
    func getMyHobby(token: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/user/my-hobby"
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseDecodable(of: HobbyResponse.self) { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self = self else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success(let hobbyResponse):
                
                completion(.success(hobbyResponse.result.hobby))
            case .failure:
                
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    
    /// 다른 사람 취미 조회 메서드 추가
    func getOtherUserHobby(token: String, userNo: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        
        let url = Environment.baseURL + "/user/" + userNo + "/hobby"
        
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(
            url,
            method: .get,
            headers: headers
        )
        .validate()
        .responseDecodable(of: HobbyResponse.self) { [weak self] response in
            guard let statusCode = response.response?.statusCode,
                  let data = response.data,
                  let self = self else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success(let hobbyResponse):
                completion(.success(hobbyResponse.result.hobby))
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    /// 유저 정보 변경 메서드 추가
    func updateUserInfo(token: String, newPassword: String?, newHobby: String?, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/user"
        let headers: HTTPHeaders = ["token": token]
        
        var parameters: [String: String] = [:]
        
        if let newHobby = newHobby, !newHobby.isEmpty {
            parameters["hobby"] = newHobby
        }
        if let newPassword = newPassword, !newPassword.isEmpty {
            parameters["password"] = newPassword
        }
        
        AF.request(
            url,
            method: .put,
            parameters: parameters,
            encoder: JSONParameterEncoder.default,
            headers: headers
        )
        .validate()
        .response { [weak self] response in
            guard let self = self else {
                completion(.failure(.unknownError))
                return
            }
            
            let statusCode = response.response?.statusCode
            
            if let statusCode = statusCode {
                
                if statusCode == 200 {
                    completion(.success(true))
                    return
                }
            } else {
                completion(.failure(.unknownError))
                return
            }
            
            
            guard let data = response.data else {
                completion(.failure(.unknownError))
                return
            }
            
            guard let statusCode = statusCode else {
                completion(.failure(.unknownError))
                return
            }
            
            let error = self.handleStatusCode(statusCode, data: data)
            completion(.failure(error))
            
        }
        
        
    }
    
    
    
    func handleStatusCode(_ statusCode: Int, data: Data) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest // 잘못된 요청
        case (400, "01"):
            return .expressionError // 유저명, 비밀번호, 취미가 8자 초과
        case (403, "01"):
            return .invalidResponse // 비밀번호가 틀림
        case (404, "00"):
            return .invalidURL // 잘못된 path
        case (404, "01"):
            return .noUserFound // 유저가 없는 경우
        case (409, "00"):
            return .duplicateError // 중복 에러
        default:
            return .unknownError
        }
    }
    
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
    
    
}

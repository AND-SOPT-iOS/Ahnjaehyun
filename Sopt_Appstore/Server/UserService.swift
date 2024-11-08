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

  /// 등록 API 콜이 일어나는 메소드
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

    /// Request시 url, method, parameters, 인코딩 방식을 파라미터로 넘겨주어야 함. ->  Alamofire
    AF.request(
      url,
      method: .post,
      parameters: parameters,
      encoder: JSONParameterEncoder.default
    )
    .validate()
    .response { [weak self] response in

  
        // 응답 상태 코드 받기, 데이터 받기
        // [weak self]이기에? let self을 사용하고 self가 nil이 아니면 강하게 참조하여 사용할 수 있도록 함.
      guard let statusCode = response.response?.statusCode,
            let data = response.data,
            let self
      else {
        completion(.failure(.unknownError))
        return
      }

      /// public let result: Result<Success, Failure>
      /// Alamofire의 data response에는 result 프로퍼티가 존재하는데, 해당 프로퍼티는 Result<Success, Failure> 타입임!
      /// 이 말은, 타입이 다른 함수에서 리턴되어 넘어갈 때, success로 넘어갈 수 있고 failure로 넘어갈 수 있다는 것
      /// 그리고 그 안에는 우리가 원하는 결과값들이 존재한다.
      /// Result<Bool, NetworkError>
      /// Success 하면 Bool 값을, Failure 하면 NetworkError를 리턴하겠다는 뜻
      /// Success에는 원하는 타입이 올 수 있고, Failure에는 Error 프로토콜이 채택된 것이 리턴될 수 있도록 되어야 함
      switch response.result {
      case .success:
        /// 네트워크 요청이 성공적으로 진행되었을 때, escaping closure을 실행하고 bool값을 success로 넘김.
        completion(.success(true))
      case .failure:
        /// 네트워크 요청이 실패했을 때, 어떤 이유인지 파악하여 escaping closure을 실행하고 파악된 error를 넘김
        let error = self.handleStatusCode(statusCode, data: data)
        completion(.failure(error))
      }
    }
  }

  /// 서버의 명세서 기반으로 에러 처리를 진행
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
            case (409, "00"):
                return .duplicateError // 중복 에러
            default:
                return .unknownError
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
                    // 성공 시 취미 반환
                    completion(.success(hobbyResponse.hobby))
                case .failure:
                    // 에러 처리
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
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







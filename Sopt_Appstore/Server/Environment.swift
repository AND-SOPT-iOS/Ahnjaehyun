//
//  Environment.swift
//  Sopt_Appstore
//
//  Created by Jaehyun Ahn on 11/8/24.
//

import Foundation


enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}


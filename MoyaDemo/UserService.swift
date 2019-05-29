//
//  LoginService.swift
//  MoyaDemo
//
//  Created by Carl Xu on 2019/5/26.
//  Copyright © 2019 Carl Xu. All rights reserved.
//

import Foundation
import Moya

let UserInfoProvider = MoyaProvider<UserInfoServiceAPI>()

enum UserInfoServiceAPI {
    case getUserInfo(userName: String, age: Int)
    case updateUserInfo(userName: String, age: Int)
}

extension UserInfoServiceAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://www.myapp.com")!
    }
    
    var path: String {
        switch self {
        case .getUserInfo:
            return "/login"
        case .updateUserInfo:
            return "/register"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUserInfo:
            return .get
        case .updateUserInfo:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getUserInfo:
            return "{\"data\":{\"name\":\"Carl\"},\"meta\":{\"status\":200,\"msg\":\"  OK\"}}".data(using: String.Encoding.utf8)!
        case .updateUserInfo:
            return "{\"data\":{\"name\":\"Xu\"},\"meta\":{\"status\":200,\"msg\":\" OK\"}}".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case let .getUserInfo(userName, age):
            return .requestParameters(parameters: ["userName" : userName, "age": age], encoding: URLEncoding.default)
        case .updateUserInfo(let userName, let age):
            return .requestParameters(parameters: ["userName" : userName, "age": age], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}



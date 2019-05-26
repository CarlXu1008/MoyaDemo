//
//  LoginService.swift
//  MoyaDemo
//
//  Created by Carl Xu on 2019/5/26.
//  Copyright © 2019 Carl Xu. All rights reserved.
//

import Foundation
import Moya

let loginProvider = MoyaProvider<LoginServiceAPI>()

enum LoginServiceAPI {
    case Login(userName: String, passwd: String)
    case Register(userName: String, passwd: String)
}

extension LoginServiceAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://www.myapp.com")!
    }
    
    var path: String {
        switch self {
        case .Login:
            return "/login"
        case .Register:
            return "/register"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        switch self {
        case .Login:
            return "{\"data\":{\"id\":\"your_new_gif_id\"},\"meta\":{\"status\":200,\"msg\":\" Login OK\"}}".data(using: String.Encoding.utf8)!
        case .Register:
            return "{\"data\":{\"id\":\"your_new_gif_id\"},\"meta\":{\"status\":200,\"msg\":\"rigester OK\"}}".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .Login(let userName, let passwd):
            return .requestParameters(parameters: ["userName" : userName, "passwd": passwd], encoding: URLEncoding.default)
        case .Register(let userName, let passwd):
            return .requestParameters(parameters: ["userName" : userName, "passwd": passwd], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}

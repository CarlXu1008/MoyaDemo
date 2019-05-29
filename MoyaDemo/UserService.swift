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



/////1. T占位类型
//struct MyResult<T> {
//    let a: T
//}
//
//protocol MyProtocol {
//
//}
//
////2.类型约束: 可以指定一个类型参数必须继承自指定的类， 或者符合一个特定的协议或协议组合
//func test<C>(a: MyResult<C>, b: MyProtocol) -> Void {
//
//}
//
///* 3. 关联类型：协议的泛型类型；
// 提供了一个占位名（或者是别名),其实际代表的类型在协议被采纳时才会被指定。
// 通过associatedtype关键字来指定关联类型。
// */
//protocol Container {
//    associatedtype ItemType
//    mutating func append(_ item: ItemType)
//    var count: Int { get }
//    subscript(i: Int) -> ItemType { get }
//}
//
//struct IntStack: Container {
//    var items = [Int]()
//
//    /// 指定关联类型
//    typealias ItemType = Int
//
//    //MARK: 实现协议方法和属性
//    mutating func append(_ item: Int) {
//        items.append(item)
//    }
//
//    var count: Int {
//        return items.count
//    }
//
//    subscript(i: Int) -> Int {
//        return items[i]
//    }
//
//}
//
//
/////1. Element:占位类型
//struct Stact<Element>: Container {
//
//    var items = [Element]()
//
//    mutating func append(_ item: Element) {
//        items.append(item)
//    }
//
//    var count: Int {
//        return items.count
//    }
//
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//
//    /// 指定关联类型
//    typealias ItemType = Element
//
//}





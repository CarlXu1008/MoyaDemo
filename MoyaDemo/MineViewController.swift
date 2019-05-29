//
//  MineViewController.swift
//  MoyaDemo
//
//  Created by Carl Xu on 2019/5/29.
//  Copyright © 2019 Carl Xu. All rights reserved.
//

import UIKit
import Moya

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        pluginsProviderDemo()
        multiProviderDemo()
    }
    
    
    /// 插件用法举例
    func pluginsProviderDemo()  {
        let myPlugin = NetworkActivityPlugin.init { (changeType, loginProvider) in
            switch changeType {
            case .began:
                print("网络请求开始: \(changeType)")
            case .ended:
                print("网络侵权介绍: \(changeType)")
            }
        }
        let myProvider = MoyaProvider<LoginServiceAPI>(plugins: [NetworkLoggerPlugin(verbose: true), myPlugin])
        myProvider.request(LoginServiceAPI.Login(userName: "Carl", passwd: "110")) { (result) in
            switch result {
            case .success(let value):
                print("success:\(value.statusCode)")
                _ = String.init(data: value.data, encoding: String.Encoding.utf8)
                break
            case .failure( _):
                break
            }
        }
    }
    
    
    /// MultiTarget用法举例
    func multiProviderDemo()  {
        let commonProvide = MoyaProvider<MultiTarget>()
        commonProvide.request(MultiTarget(LoginServiceAPI.Login(userName: "", passwd: ""))) { (result) in
            
        }
        commonProvide.request(MultiTarget(GitHub.zen)) { (result) in
            
        }
    }

    

}

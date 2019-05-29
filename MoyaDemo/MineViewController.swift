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

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view
//        loginProvider.request(LoginServiceAPI.Login(userName: "Carl", passwd: "110")) { (result) in
//            switch result {
//            case .success(let value):
//                print("success:\(value.statusCode)")
//                let dataStr = String.init(data: value.data, encoding: String.Encoding.utf8)
//                print("success: \(dataStr ?? "")")
//                break
//            case .failure(let error):
//                print("failure: \(error)")
//                break
//            }
//        }
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  MoyaDemo
//
//  Created by Carl Xu on 2019/5/26.
//  Copyright © 2019 Carl Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginProvider.request(LoginServiceAPI.Login(userName: "Carl", passwd: "110")) { (result) in
            switch result {
            case .success(let res):
                print("response:\(res.statusCode)")
                let dataStr = String.init(data: res.data, encoding: String.Encoding.utf8)
                print("response:\(dataStr)")
                break
            default:
                break
            }
        }
    }


}


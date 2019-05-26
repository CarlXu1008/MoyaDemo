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
            case .success(let value):
                print("success:\(value.statusCode)")
                let dataStr = String.init(data: value.data, encoding: String.Encoding.utf8)
                print("success: \(dataStr)")
                break
            case .failure(let error):
                print("failure: \(error)")
                break
            }
        }
    }


}


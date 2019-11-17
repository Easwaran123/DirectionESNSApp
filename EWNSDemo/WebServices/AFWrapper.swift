//
//  AFWrapper.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import Alamofire

protocol AFWrapper {
    func get(urlRequest: URLRequestConvertible, completion: @escaping (Result<Any>) -> Void)
}

class NetworkClient: AFWrapper {
    
    func get(urlRequest: URLRequestConvertible, completion: @escaping (Result<Any>) -> Void) {
        Alamofire.request(urlRequest).responseJSON { (response) in
            completion(response.result)
        }
    }
}

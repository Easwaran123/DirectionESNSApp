//
//  AFRouter.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import Alamofire


enum AFRouter: URLRequestConvertible {
    
    static let baseURL = "https://api.data.gov.sg/v1/environment/psi"
    
    case get(String,String)
    
    func asURLRequest() throws -> URLRequest {
        
        let result: (path: String, parameters: Parameters) = {
            switch self {
            case .get(let dateTime, let dateValue):
                return ("", ["date_time": dateTime,"date": dateValue])
            }
        }()
        
        let url = try AFRouter.baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(result.path))
        request.addValue(AFConstants.API_KEY, forHTTPHeaderField: "api-key")
        
        return try URLEncoding.default.encode(request, with: result.parameters)
        
    }
}

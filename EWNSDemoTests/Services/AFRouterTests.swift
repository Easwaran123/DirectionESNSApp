//
//  Annotation.swift
//  EWNSDemo
//
//  Created by Logesh on 17/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Alamofire

@testable import EWNSDemo

class AFRouterTests: QuickSpec {
    override func spec() {
        
        describe("AFRouter") {
            var subject: AFRouter!
            var urlRequest: URLRequest!
            
            context("when calling PSI api") {
                let dateStringTime = "2019-11-17T15:16:19"
                let dateString = "2019-11-17"
                beforeEach {
                    subject = AFRouter.get(dateStringTime, dateString)
                    urlRequest = try! subject.asURLRequest()
                }
                
                it("should be a GET request") {
                    expect(urlRequest.httpMethod).to(equal(HTTPMethod.get.rawValue))
                }
                
                it("should point to right end point") {
                    expect(urlRequest.url?.path).to(equal("/v1/environment/psi"))
                }
                
                it("should append date_time as query parameter") {
                    expect(urlRequest.url?.query?.components(separatedBy: "=").first).to(equal("date_time"))
                }
                it("should append date as query parameter") {
                    expect(urlRequest.url?.query?.components(separatedBy: "=").first).to(equal("date"))
                }
            }
        }
    }
}
       

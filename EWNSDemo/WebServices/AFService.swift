//
//  AFService.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import SwiftyJSON


class AFService {
 
    var networkClient: NetworkClient
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }()
    
    lazy var dateFormat: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        return dateFormat
    }()
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getPSI(date: Date, completion: @escaping ([ItemModel]) -> Void) {
        let dateStringTime = dateFormatter.string(from: date)
        let dateString = dateFormatter.string(from: date)
      
        self.networkClient.get(urlRequest: AFRouter.get(dateStringTime , dateString)) { (result) in
            if result.isSuccess {
                var psis = [ItemModel]()
                
                let json = JSON(result.value!)
                for regionJSON in json["region_metadata"].arrayValue {
                    if let region = RegionModel.init(json: regionJSON) {
                        psis.append(ItemModel(region: region))
                       
                    }
                }
                
                let readingJSON = json["items"][0]["readings"]
                for i in psis.indices {
                    psis[i].parseFromJSON(json: readingJSON)
                }
                completion(psis)
            } else {
                
                completion([])
            }
        }
    }
}

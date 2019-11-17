//
//  ItemModel.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import SwiftyJSON


struct ItemModel {
    
    var region: RegionModel
    var psiTwentyFourHourly: Int?
    var pm25TwentyFourHourly: Int?
    var pm10TwentyFourHourly : Int?
    var co_eight_hour_max: Int?
    var co_sub_index: Int?
    var no2_one_hour_max : Int?
    var o3_eight_hour_max: Int?
    var o3_sub_index: Int?
    var pm25_sub_index : Int?
    var so2_sub_index: Int?
    var so2_twenty_four_hourly: Int?
    var pm10_sub_index : Int?
    
    init(region: RegionModel) {
        self.region = region
    }
    
    mutating func parseFromJSON(json: JSON) {
        let direction = self.region.direction.rawValue
        
        self.psiTwentyFourHourly = json["psi_twenty_four_hourly"][direction].int
        self.pm25TwentyFourHourly = json["pm25_twenty_four_hourly"][direction].int
        self.pm10TwentyFourHourly = json["pm10_twenty_four_hourly"][direction].int
        self.co_eight_hour_max = json["co_eight_hour_max"][direction].int
        self.co_sub_index = json["co_sub_index"][direction].int
        self.no2_one_hour_max = json["no2_one_hour_max"][direction].int
        self.o3_eight_hour_max = json["o3_eight_hour_max"][direction].int
        self.o3_sub_index = json["o3_sub_index"][direction].int
        self.pm25_sub_index = json["pm25_sub_index"][direction].int
        self.so2_sub_index = json["so2_sub_index"][direction].int
        self.so2_twenty_four_hourly = json["so2_twenty_four_hourly"][direction].int
        self.pm10_sub_index = json["pm10_sub_index"][direction].int
        
    }
    
    func getDescription() -> String {
        
        var description  = self.nilCohesingText(title: "psi_twenty_four_hourly", value: self.psiTwentyFourHourly)
        description += "\n" + self.nilCohesingText(title: "pm25_twenty_four_hourly", value: self.pm25TwentyFourHourly)
        description += "\n" + self.nilCohesingText(title: "pm10_twenty_four_hourly", value: self.pm10TwentyFourHourly)
        description += "\n" + self.nilCohesingText(title: "co_eight_hour_max", value: self.co_eight_hour_max)
        description += "\n" + self.nilCohesingText(title: "co_sub_index", value: self.co_sub_index)
        description += "\n" + self.nilCohesingText(title: "no2_one_hour_max", value: self.no2_one_hour_max)
        description += "\n" + self.nilCohesingText(title: "o3_eight_hour_max", value: self.o3_eight_hour_max)
        description += "\n" + self.nilCohesingText(title: "o3_sub_index", value: self.o3_sub_index)
        description += "\n" + self.nilCohesingText(title: "pm25_sub_index", value: self.pm25_sub_index)
        description += "\n" + self.nilCohesingText(title: "so2_sub_index", value: self.so2_sub_index)
        description += "\n" + self.nilCohesingText(title: "so2_twenty_four_hourly", value: self.so2_twenty_four_hourly)
        description += "\n" + self.nilCohesingText(title: "pm10_sub_index", value: self.pm10_sub_index)
        
        return description
    }
    
    private func nilCohesingText<T>(title: String, value: T?) -> String {
        if let value = value {
            return "\(title): \(value)"
        } else  {
            return "\(title): nil"
        }
    }
}

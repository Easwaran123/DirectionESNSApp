//
//  JsonModel.swift
//  EWNSDemo
//
//  Created by Logesh on 16/11/19.
//  Copyright © 2019 Logesh. All rights reserved.
//

import Foundation
import SwiftyJSON


protocol JsonModel {
    init?(json: JSON)
}

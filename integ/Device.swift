//
//  Device.swift
//  integ
//
//  Created by Carlos Rodriguez on 25/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import Foundation
struct Device: Codable {
    var device: String
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case device = "type"
        case token
    }
}

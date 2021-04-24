//
//  User.swift
//  integ
//
//  Created by Carlos Rodriguez on 22/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import Foundation

class User: NSObject, Codable {
        var username: String!
            
        init(_ username:String, _ highscore:Int) {
            self.username = username

        }
     
}

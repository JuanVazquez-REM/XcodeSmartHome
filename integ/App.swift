//
//  App.swift
//  integ
//
//  Created by Carlos Rodriguez on 22/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import Foundation

class App: NSObject {
    
    static let shared = App()
    let defaults = UserDefaults.standard
    var users = [User]()

}

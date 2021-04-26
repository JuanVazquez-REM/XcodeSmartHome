//
//  User.swift
//  integ
//
//  Created by Carlos Rodriguez on 22/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit

struct User: Codable {
        var name: String!
        var correo: String!
        var contra: String!
    init(_ name:String, correo:String, _ contra:String) {
        self.name = name
        self.correo = correo
        self.contra = contra
        }
        
        func updateToken(){
            print("Actualizando token")
        }
}

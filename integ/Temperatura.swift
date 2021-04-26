//
//  Temperatura.swift
//  integ
//
//  Created by Carlos Rodriguez on 26/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import Foundation

struct temp:Codable {
    var tipo: String!
    var Temperatura: String!
    init(_ tipo:String,_ Temperatura:String) {
        self.tipo = tipo
        self.Temperatura  = Temperatura
    }
}
struct cochera {
    var open: String!
    var close: String!
    init(_ open:String, _ close:String) {
        self.open = open
        self.close = close
    }
}
struct focos {
    var tipo: String!
    var foco: String!
    init(_ tipo:String, _ foco:String) {
        self.tipo = tipo
        self.foco = foco
    }
}

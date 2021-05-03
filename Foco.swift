//
//  Foco.swift
//  
//
//  Created by Carlos Rodriguez on 29/04/21.
//

import Foundation

final class foco {
    
}
struct Control: Codable {
    let Controles: [Foco]
}
struct Foco: Codable {
    let tipo: String
    let nombre: String
    let descripcion: String
}

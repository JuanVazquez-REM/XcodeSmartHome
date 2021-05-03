//
//  FocosController.swift
//  integ
//
//  Created by Carlos Rodriguez on 29/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire

class FocosController: UIViewController {
        
    @IBOutlet weak var focos: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var encendido: UIButton!
    @IBOutlet weak var cerrar: UIButton!
    
    var luz = [FOCOS]()
    
    override func viewDidLoad() {

                }
    func peticion() {
         AF.request("http://54.146.120.131:3333/lights").response { response in debugPrint(response)
        }
    }
}


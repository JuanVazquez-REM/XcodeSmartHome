//
//  BienvenidoController.swift
//  integ
//
//  Created by Carlos Rodriguez on 04/05/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire

class BienvenidoController: UIViewController {

    @IBOutlet weak var usuario: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("http://54.146.120.131:3331/", method: .get, parameters:["clave":"valor"]).responseJSON() {response in
            print(response)}

    }

    @IBAction func acceder(_ sender: Any) {
        performSegue(withIdentifier: "menu", sender: nil)
    }
}

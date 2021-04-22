//
//  NewUserController.swift
//  integ
//
//  Created by Carlos Rodriguez on 21/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit

class NewUserController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func registro(_ sender: Any) {
        performSegue(withIdentifier: "reg1", sender: nil)
    }
    @IBAction func cancelar(_ sender: Any) {
        performSegue(withIdentifier: "reg2", sender: nil)
    }
}

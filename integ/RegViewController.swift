//
//  RegViewController.swift
//  integ
//
//  Created by Mac04 on 23/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit


class RegViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                }
    
    @IBAction func segue(_ sender: Any) {
        performSegue(withIdentifier: "sg", sender: nil)
    }
    @IBAction func btn_reg(_ sender: Any) {
        performSegue(withIdentifier: "reg", sender: nil)
    }
    @IBAction func btn_login(_ sender: Any) {
        let nombretxt = usernameTextField.text!
        let passwordtxt = passwordTextField.text!


        if(nombretxt.count > 0 && passwordtxt.count > 0){
                    
        }
    }
}
    /*func registro(){
        AF.request("url",method: .post,parameters:["clave":"valor"], headers: <#T##HTTPHeaders?#> , encoding: <#T##ParameterEncoding#>)
    }*/

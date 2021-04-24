//
//  RegViewController.swift
//  integ
//
//  Created by Mac04 on 23/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire

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
        if usernameTextField.text!.isEmpty || passwordTextField.text!.isEmpty{
            alertDefault(with: "Error", andWithMsg: "Campos vacios")
            usernameTextField.shake()
            passwordTextField.shake()
            }else{
                self.performSegue(withIdentifier: "sg", sender: nil)
                /*AF.request("",
                    method: .post,
                    parameters: ["email":"User.email"],
                    encoding: JSONEncoding.default)*/
                AF.request("http://54.146.120.131:3333/login", method: .post, parameters: ["email":User.).response { response in debugPrint(response)
            }
        }
    }

    /*func registro(){
        AF.request("url",method: .post,parameters:["clave":"valor"], encoding: JSONEncoding.default)
    }*/
}

//
//  RegViewController.swift
//  integ
//
//  Created by Mac04 on 23/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire
import Starscream

class RegViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let defaults = UserDefaults.standard

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
        let userTxt = usernameTextField.text!
        if usernameTextField.text!.isEmpty || passwordTextField.text!.isEmpty{
            alertDefault(with: "Error", andWithMsg: "Campos vacios")
            usernameTextField.shake()
            passwordTextField.shake()
            }
            else{
                self.performSegue(withIdentifier: "sg", sender: nil)
                let usuario = User(userTxt,correo: usernameTextField.text!,passwordTextField.text!)
                let usuarios:[User] = [usuario]
                do
                {
                    let jsonEncoder = JSONEncoder()
                    let data = try jsonEncoder.encode(usuarios)
                    defaults.set(data,forKey: "usuarios")
                    defaults.synchronize()
                    print("usuario logueado")
                }catch{
                    print("Error")
                }
    AF.request("http://54.146.120.131:3333/login", method: .post, parameters: ["email":usuario.correo,"password":usuario.contra]).response { response in debugPrint(response)
            }
        }
    }
}

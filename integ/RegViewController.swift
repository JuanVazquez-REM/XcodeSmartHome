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


    @IBOutlet weak var sesion: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

                }
    @IBAction func btn_reg(_ sender: Any) {
        performSegue(withIdentifier: "reg1", sender: nil)
    }
    @IBAction func btn_login(_ sender: Any) {
        let headers: HTTPHeaders = [
                 "Accept":"application/json"
             ]
             
                 if  usernameTextField.text != "" && passwordTextField.text != ""{
                     let params = ["password": passwordTextField.text!, "email": usernameTextField.text!]
                     //print(params)
                     guard let password = passwordTextField.text else {return}
                     guard let email = usernameTextField.text else {return}
                     self.defaults.setValue(password, forKey: "password")
                     self.defaults.setValue(email, forKey: "email")
                    AF.request("http://54.146.120.131:3331/login", method: .post, parameters: params, headers: headers).responseJSON() { [self] response in
                        print(response)
                        switch response.result {
                         case .success(let value):
                            guard let jsonArray = value as? [String:Any] else {return}
                            guard let token = jsonArray["token"] as? String else { return}
                            self.defaults.set(token, forKey: "token")
                             if self.defaults.string(forKey: "token") != nil{
                                 sesion.sendActions(for: .touchUpInside)
                                self.performSegue(withIdentifier: "sg", sender: nil)
                              }
                             let ac = UIAlertController(title: "Error", message: "Contraseña o usuario erroneo", preferredStyle: .alert)
                             ac.addAction(UIAlertAction(title: "Cerrar", style: .default))
                             self.present(ac, animated: true, completion: nil)
                           case .failure(let error):
                             print(error)
                          }
                     }
                 }else{
                     let ac = UIAlertController(title: "Error", message: "Los campos estan incompletos", preferredStyle: .alert)
                     ac.addAction(UIAlertAction(title: "Ok", style: .default))
                     self.present(ac, animated: true, completion: nil)
                     
                     }
                 }
             }

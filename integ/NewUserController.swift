//
//  NewUserController.swift
//  integ
//
//  Created by Carlos Rodriguez on 21/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire
class NewUserController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var session: UIButton!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var apellido: UILabel!
    @IBOutlet weak var correo: UILabel!
    @IBOutlet weak var password: UILabel!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func registro(_ sender: Any) {
           let headers: HTTPHeaders = [
                    "Accept":"application/json"
                ]
                
                    if  nombre.text != "" && apellido.text != ""{
                        if correo.text != "" && password.text != "" {
                            let params = ["nombre": nombre.text!, "apellido": apellido.text!,"password": password.text!, "email": correo.text!]
                            //print(params)
                            guard let nombre = nombre.text else {return}
                            guard let apellido = apellido.text else {return}
                            guard let password = password.text else {return}
                            guard let email = correo.text else {return}
                            self.defaults.setValue(nombre, forKey: "nombre")
                            self.defaults.setValue(apellido, forKey: "apellido")
                            self.defaults.setValue(password, forKey: "password")
                            self.defaults.setValue(email, forKey: "email")
                           AF.request("http://54.146.120.131:3331/register", method: .post, parameters: params, headers: headers).responseJSON() { [self] response in
                               print(response)
                               switch response.result {
                                case .success(let value):
                                   guard let jsonArray = value as? [String:Any] else {return}
                                   guard let token = jsonArray["token"] as? String else {return}
                                   self.defaults.set(token, forKey: "token")
                               case .failure(_):
                                print("Algo salio mal")
                               }
                            }
                        }else{
                            let ac = UIAlertController(title: "Error", message: "Los campos estan incompletos", preferredStyle: .alert)
                            ac.addAction(UIAlertAction(title: "Ok", style: .default))
                            self.present(ac, animated: true, completion: nil)
                            
                            }
                        }
                    else {
                        nombre.shake()
                        apellido.shake()
                        correo.shake()
                        password.shake()
                        alertDefault(with: "Error", andWithMsg: "campos vacios")
                    }
                        }
                    }

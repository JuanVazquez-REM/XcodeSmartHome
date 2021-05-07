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
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var pass: UITextField!
    
    
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func registro(_ sender: Any) {
           let headers: HTTPHeaders = [
                    "Accept":"application/json"
                ]
        if name.text!.count > 0 && lastname.text!.count > 0 && email.text!.count > 0 && pass.text!.count > 0{
            let params = ["nombre": name.text!, "apellido": lastname.text!,"password": pass.text!, "email": email.text!]
            //print(params)
            guard let nombre = name.text else {return}
            guard let apellido = lastname.text else {return}
            guard let password = pass.text else {return}
            guard let correo = email.text else {return}
            self.defaults.setValue(nombre, forKey: "nombre")
            self.defaults.setValue(apellido, forKey: "apellido")
            self.defaults.setValue(password, forKey: "password")
            self.defaults.setValue(correo, forKey: "email")
           AF.request("http://54.146.120.131:3331/register", method: .post, parameters: params, headers: headers).responseJSON() {response in
               print(response)
               switch response.result {
               case .success:
                self.performSegue(withIdentifier: "reg2", sender: nil)
                break
                    
               case .failure(_):
                print("Algo salio mal")
               }
            }
        }
        else {
            name.shake()
            lastname.shake()
            email.shake()
            pass.shake()
            alertDefault(with: "Error", andWithMsg: "campos vacios")
            let ac = UIAlertController(title: "Error", message: "Los campos estan incompletos", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(ac, animated: true, completion: nil)
            
        }
    }
    @IBAction func btn_can(_ sender: Any) {
        performSegue(withIdentifier: "reg3", sender: nil)
    }
}

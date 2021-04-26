//
//  NewUserController.swift
//  integ
//
//  Created by Carlos Rodriguez on 21/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit

class NewUserController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var apeidoTextField: UITextField!
    
    @IBOutlet weak var correoTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func registro(_ sender: Any) {
        let userTxt = nameTextField.text!
        if (userTxt.count > 0 && correoTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0){
                let user = User(userTxt, correo:correoTextField.text!, passwordTextField.text!)
                let usuarios:[User] = [user]
                
                do{
                    let jsonEncoder = JSONEncoder()
                    let data = try jsonEncoder.encode(usuarios)
                    
                    defaults.set(data,forKey: "usuarios")
                    defaults.synchronize()
                    print("usuario registrado")
                    
                }catch{
                    print("Error")
                }
                     }else{
                    alertDefault(with: "Error", andWithMsg: "Campos vacios")
                    nameTextField.shake()
                    passwordTextField.shake()
                    correoTextField.shake()
                    passwordTextField.shake()
                }
            }
        }

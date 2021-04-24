//
//  NewUserController.swift
//  integ
//
//  Created by Carlos Rodriguez on 21/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit

class NewUserController: UIViewController {


    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var apeidoTextField: UITextField!
    
    @IBOutlet weak var correoTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func reg(_ sender: Any) {
        //alertDefault(with: "Error2", andWithMsg: "Campos vacios")
        //performSegue(withIdentifier: "reg1", sender: nil)
    }
    
    @IBAction func registro(_ sender: Any) {
        
        if !nameTextField.text!.isEmpty && apeidoTextField.text!.isEmpty{
            if !correoTextField.text!.isEmpty && passwordTextField.text!.isEmpty{
                self.performSegue(withIdentifier: "reg1", sender: nil)            }else{
                    alertDefault(with: "Error", andWithMsg: "Campos vacios")
                    nameTextField.shake()
                    passwordTextField.shake()
                    correoTextField.shake()
                    passwordTextField.shake()            }
        }else{
            alertDefault(with: "Error", andWithMsg: "Campos vacios")
            nameTextField.shake()
            passwordTextField.shake()
            correoTextField.shake()
            passwordTextField.shake()
        }
        }
}


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

    @IBAction func btn_login(_ sender: Any) {
        let nombretxt = usernameTextField.text!
        let passwordtxt = passwordTextField.text!
        
        if(nombretxt.count > 0 && passwordtxt.count > 0){
            
            Alamofire.request("http://34.207.94.77:3333/login",method: .post).response { response in
               
            }
        }
    }
    
}

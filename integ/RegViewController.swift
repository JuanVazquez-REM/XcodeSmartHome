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
        /*        AF.request("http://3.95.199.7:3333/show/last")
                .response {(response) in
                    debugPrint(response)
            }
            
            let header : HTTPHeaders = [
            .accept("")
            ]
            AF.request("http://3.95.199.7:3333/show/last" , headers: header)
                .responseJSON { (response) in
                    print(response)
                    
            }*/
                }
        

    }

    @IBAction func btn_login(_ sender: Any) {
        let nombretxt = usernameTextField.text!
        let passwordtxt = passwordTextField.text!
        
        if(nombretxt.count > 0 && passwordtxt.count > 0){
            
            Alamofire.request("http://34.207.94.77:3333/login",method: .post).response { response in
               
            }
        }

                
            }
    
    @IBAction func TapButton() {
        let username = usernameTextField.text
        let password = passwordTextField.text
        	
    }

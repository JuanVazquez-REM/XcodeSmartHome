//
//  TempViewController.swift
//  integ
//
//  Created by Diseno on 25/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire

class TempViewController: UIViewController {

    override func viewDidLoad() {
                
                view.addBackground()
                view.addBackground(imageName: "cieloo.jpeg")
                view.addBackground(contentMode: .scaleAspectFit)
                view.addBackground(imageName: "cieloo.jpeg", contentMode: .scaleAspectFit)
                
        AF.request("http://3.95.199.7:3333/show/last")
            .response {(response) in
                debugPrint(response)
        }
        
        let header : HTTPHeaders = [
        .accept("")
        ]
        AF.request("http://3.95.199.7:3333/show/last" , headers: header)
            .responseJSON { (response) in
                print(response)
                
        }
            }
    
            
        }
extension UIView {
    func addBackground(imageName: String = "cieloo.jpeg", contentMode: UIView.ContentMode = .scaleToFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: "cieloo.jpeg")
        backgroundImageView.contentMode = contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)

        // adding NSLayoutConstraints
        let leadingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)

        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
   
            

       
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



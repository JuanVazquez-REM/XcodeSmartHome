//
//  CocheraViewController.swift
//  integ
//
//  Created by Diseno on 25/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Alamofire
class CocheraViewController: UIViewController {
   
    override func viewDidLoad() {
        
        view.privateaddBackground()
        view.privateaddBackground(imageName: "coche.jpeg")
        view.privateaddBackground(contentMode: .scaleAspectFit)
        view.privateaddBackground(imageName: "coche.jpeg", contentMode: .scaleAspectFit)}
        
                
    @IBAction func btnOpen(_ sender: Any) {
        /*AF.request("http://54.146.120.131:3333/", method: .post, parameters: ["":]).response { response in debugPrint(response)*/
    }
    @IBAction func btnClose(_ sender: Any) {
    }
}

extension UIView {
    func privateaddBackground(imageName: String = "coche.jpeg", contentMode: UIView.ContentMode = .scaleToFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: "coche.jpeg")
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

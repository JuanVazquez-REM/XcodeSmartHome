//
//  LucesViewController.swift
//  integ
//
//  Created by Diseno on 25/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit


class LucesViewController: UIViewController {

   override func viewDidLoad() {
                    
                    view.LaddBackground()
                    view.LaddBackground(imageName: "Luces.png")
                    view.LaddBackground(contentMode: .scaleAspectFit)
                    view.LaddBackground(imageName: "Luces.png", contentMode: .scaleAspectFit)
                    
                }
    
    
    
                
            }
               /* AF.request("http://3.95.199.7:3333/show/last")
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
    extension UIView {
        func LaddBackground(imageName: String = "Luces.png", contentMode: UIView.ContentMode = .scaleToFill) {
            // setup the UIImageView
            let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
            backgroundImageView.image = UIImage(named: "Luces.png")
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
       


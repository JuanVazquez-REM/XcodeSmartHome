//
//  HumedadViewController.swift
//  integ
//
//  Created by Diseno on 26/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit

class HumedadViewController: UIViewController {
    override func viewDidLoad() {
                    
                    view.HaddBackground()
                    view.HaddBackground(imageName: "Humedad.png")
                    view.HaddBackground(contentMode: .scaleAspectFit)
                    view.HaddBackground(imageName: "Humedad.png", contentMode: .scaleAspectFit)
                    
                }
                
            }
    extension UIView {
        func HaddBackground(imageName: String = "Humedad.png", contentMode: UIView.ContentMode = .scaleToFill) {
            // setup the UIImageView
            let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
            backgroundImageView.image = UIImage(named: "Humedad.png")
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
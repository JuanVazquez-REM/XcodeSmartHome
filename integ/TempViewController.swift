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

    //private let Data = "data"
    private var Temperatura = ""
    override func viewDidLoad() {

    }
    func addBackground(imageName: String = "cieloo.jpeg", contentMode: UIView.ContentMode = .scaleToFill) {
        // setup the UIImageView
        let backgroundImageView = UIImageView(frame: UIScreen.main.bounds)
        backgroundImageView.image = UIImage(named: "cieloo.jpeg")
        backgroundImageView.contentMode = contentMode
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false


        let leadingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let trailingConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: backgroundImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)

        NSLayoutConstraint.activate([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
    @IBOutlet weak var DATA: UITableView!
    @IBAction func btnGet(_ sender: Any) {
        var data = [String]()
        data.append(contentsOf: [])
        AF.request("http://54.146.120.131:3333/data/device", method: .post, parameters: ["tipo":Temperatura]).response { response in debugPrint(response)
       
    }
        
    }
    private func ShowAlert(message: String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}






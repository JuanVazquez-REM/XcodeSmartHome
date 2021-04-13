//
//  ViewController.swift
//  integ
//
//  Created by mac02 on 17/02/21.
//  Copyright © 2021 mac02. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    private let ImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 370, height: 700))
        imageView.image = UIImage(named: "Splash")
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ImageView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        ImageView.center = view.center

        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.animated()
        })
    }
        
    private func animated() {
        
        
        let viewController = RegViewController()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        performSegue(withIdentifier: "splash", sender: nil)
       
        
        
    }
}



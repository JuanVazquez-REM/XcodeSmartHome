//
//  Extensiones.swift
//  integ
//
//  Created by Carlos Rodriguez on 22/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
extension UIView {
    func round() {
        self.layer.cornerRadius = self.bounds.height / 2
    }
    
    func shake(){
            self.transform = CGAffineTransform(translationX: 20, y: 0)
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)
    }
}

extension UIViewController {
    func alertDefault(with title:String, andWithMsg description:String){
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(a) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
}


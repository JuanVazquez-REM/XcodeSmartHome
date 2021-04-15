//
//  FocosCollectionViewController.swift
//  integ
//
//  Created by mac03 on 13/04/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit



class FocosCollectionViewController: UICollectionViewController {
    let f1:Foco = Foco(nombre: "foco sala",descripcion: "este foco esta en la sala",pin: 12)
    
    var dataSource: [Foco] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.append(f1)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    ca

   

}

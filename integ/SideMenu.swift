//
//  SideMenu.swift
//  integ
//
//  Created by Mac04 on 23/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import UIKit
import Foundation


class SideMenu: UIViewController {

   // var menu: SideMenuNavigationController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //menu = SideMenuNavigationController(rootViewController: MenuListController())
        //menu?.leftSide = true
       // menu?.setNavigationBarHidden(true, animated: false)
        
        //SideMenuManager.default.leftMenuNavigationController = menu
        //SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }
    @IBAction func MenuButon() {
    //present(menu!, animated: true)
    }
}
class MenuListController: UITableViewController {
    var items = [String]()
    var image = ["cloud.sun.rain.fill", "car.fill", "lightbulb.fill", "gear","","","","","","","","","","","","","","","person.crop.circle.fill.badge.xmark" ]
    var posicion = 0
    
    
    let darkColor = UIColor(red: 33/27.0, green: 33/51.0, blue: 33/120.0, alpha: 1)

        
    override func viewDidLoad() {
        super.viewDidLoad()
        items = ["Temperatura" , "Cochera", "Luces", "Humedad", "","","","","","","","","","","","","","","Salir"]
        tableView.backgroundColor = .black
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        cell.imageView?.image = UIImage(systemName: image[posicion])
        posicion += 1
        cell.imageView?.tintColor = .white
        cell.textLabel?.textColor = .white
        cell.backgroundColor = .black
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let p = TempViewController()
            navigationController?.pushViewController(p, animated: true)
          }

          if indexPath.row == 1 {
            let p = CocheraViewController()
            navigationController?.pushViewController(p, animated: true)
          }

          if indexPath.row == 2 {
           let p = LucesViewController()
            navigationController?.pushViewController(p, animated: true)
          }
          if indexPath.row == 3 {
            let p = HumedadViewController()
            navigationController?.pushViewController(p, animated: true)
             }
        if indexPath.row == 7 {
        let p = HumedadViewController()
        navigationController?.pushViewController(p, animated: true)
         }

    }
}
    



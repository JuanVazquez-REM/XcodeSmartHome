//
//  Menu.swift
//  integ
//
//  Created by Mac04 on 23/03/21.
//  Copyright © 2021 mac02. All rights reserved.
//

import SideMenu
import UIKit

class ViewController: UIViewController {

    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }
    @IBAction func MenuButon() {
    present(menu!, animated: true)
    }
    

}
class MenuListController: UITableViewController {
    
    var items = ["Home", "Temperatura" , "Cochera", "Luces", "Humo"]
    var image = ["house.fill", "cloud.sun.rain.fill", "car.fill", "lightbulb.fill", "gear"]
    var posicion = 0
    
    let darkColor = UIColor(red: 33/27.0, green: 33/51.0, blue: 33/120.0, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
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
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}


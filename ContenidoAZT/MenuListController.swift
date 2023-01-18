//
//  MenuList.swift
//  ContenidoAZT
//
//  Created by Abel Gonzalez on 28/09/22.
//

import UIKit
import SideMenu

class MenuListController: UITableViewController {
    var items: [String] = ["Inicio","Realities","Programas","Series","Versión"]
    
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let sTipo:String = dDta["tipo"] ?? ""
        
        switch items[indexPath.item] {
        case items[0]:
            print("Inicio ")
        case items[1]:
            print("Seleccionaste Realities")
            
        case items[2]:
            print("Programas")
            
        case items[3]:
            print("Series")
            
        case items[4]:
            let alert = UIAlertController(title: "Version de la App", message: getVersion(), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        default:
            print("Error de seleccion")
            
        }
    }
    
//MARK: Otras funciones
    
    func getVersion() -> String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return "no version info"
        }
        return version
    }
    
    func buildNumber () -> String {
        if var build = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return build
        }
        return "Build Number Not Available"
    }
    
    func startNavigation( ){
        present(ViewControllerB(), animated: true)
    }
    
}



//let alert = UIAlertController(title: "Version de la App", message: "Version 1.0", preferredStyle: UIAlertController.Style.alert)
//alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//self.present(alert, animated: true, completion: nil)

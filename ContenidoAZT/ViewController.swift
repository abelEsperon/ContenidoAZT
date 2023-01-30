//
//  ViewController.swift
//  ContenidoAZT
//
//  Created by Abel Gonzalez on 30/08/22.
//

import UIKit
import SafariServices
import SideMenu
import FirebaseAnalytics

class ViewController: UIViewController {
    var contentTVA : [Item] = []
    var siteTVA : [Datos] = []
    var menu : SideMenuNavigationController?
    
    @IBOutlet weak var tableContent: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Se registra celda personilizada
        tableContent.register(UINib(nibName: "CellContent", bundle: nil), forCellReuseIdentifier: "tablaContenido")
        
        tableContent.delegate = self
        tableContent.dataSource = self
        
        parseaJSON()
        
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        //menu?.setNavigationBarHidden(true, animated: false)
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
        // Analytics event
        Analytics.logEvent("InitScreen", parameters: ["message":"Integracion de Firebase"])
    }
    
    
    @IBAction func didTapMenu(_ sender: Any) {
        present(menu!, animated: true)
    }
    
    //MARK: - Decode JSON
    func parseaJSON(){
        let urlString = "https://tiradodev.github.io/appLite/pruebaAzteca.json"
        if let url = URL(string: urlString){
            if let data = try? Data(contentsOf: url){
                let decodificador = JSONDecoder()

                if let datosDecodificados = try?
                    decodificador.decode(Content.self, from: data) {

                    contentTVA = datosDecodificados.items
                    tableContent.reloadData()
                }
            }
        }
    }
    
    func muestraSitio(urlSitio: String){
         if let urlAZT = URL(string: urlSitio){
            if let data = try? Data(contentsOf: urlAZT){
                 let decodificador = JSONDecoder( )
    
                 if let datosDecodificados = try?
                     decodificador.decode(Sitio.self, from: data) {
                     siteTVA = datosDecodificados.data
                     self.viewDidLoad()
                    }
                }
            }
        }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return contentTVA.count
    }
    
    //MARK: - Fill Table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableContent.dequeueReusableCell(withIdentifier: "tablaContenido", for: indexPath) as! CellContent
//        celda.textLabel?.text = articuloNotas[indexPath.row].tipo
//        celda.detailTextLabel?.text = articuloNotas[indexPath.row].imagetv
        
        if let url = URL(string: contentTVA[indexPath.row].imagen ) {
            if let imagenData = try? Data(contentsOf: url) {
                celda.cellContent.image = UIImage(data: imagenData)
            }
        }
        return celda
    }
    
    //MARK: - Cell Selecction
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableContent.deselectRow(at: indexPath, animated: true)
         //let titulo = URL(string: sitioTVA[indexPath.startIndex].title)
        
        let acceso = contentTVA[indexPath.row].itemPrivate
            
        if ("0" == acceso) {
            let alert = UIAlertController(title: "Contenido no disponible", message: "Intente mas tarde", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
//            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive , handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        muestraSitio(urlSitio: contentTVA[indexPath.row].programa )
        guard let urlMostrar = URL(string: siteTVA[indexPath.startIndex].url) else
        { return }
        let VCSS = SFSafariViewController(url: urlMostrar)
        
        present(VCSS, animated: true)
    }
    
//    func startNavigation( ){
//        present(ViewControllerB(), animated: false)
//    }
    
}
    

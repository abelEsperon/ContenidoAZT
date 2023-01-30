//
//  AuthViewController.swift
//  ContenidoAZT
//
//  Created by Abel Gonzalez on 29/01/23.
//
import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwdTextField: UITextField!
    @IBOutlet weak var singUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    
    
    @IBAction func emailTextFiel(_ sender: Any) {
        
    }
    
    @IBAction func singUpButtonAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwdTextField.text {
            Auth.auth() .createUser (withEmail: email, password: password) {
                (result, error) in
                
                if let result = result, error == nil {
                    
                    self.navigationController?
                        .pushViewController(HomeViewController(email:
                                                                result.user .email!, provider: .basic), animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title:"Aceptar", style: .default))
                    self.present (alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
    }
    
    
}

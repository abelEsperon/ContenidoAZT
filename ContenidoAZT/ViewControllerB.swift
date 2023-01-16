//
//  ViewControllerB.swift
//  ContenidoAZT
//
//  Created by Abel Gonzalez on 29/12/22.
//

import UIKit

class ViewControllerB: UIViewController{
    
    private var dismissUIButton: UIButton {
        var config = UIButton.Configuration.bordered()
        config.title = "Dismiss Button"
        
        let button = UIButton (type: .system, primaryAction: UIAction(handler: { _ in
            self.dismissViewControllerB()
        }))
        
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let colorExample = UIColor(red: 100/255.0, green: 10/255.0, blue: 100/255.0, alpha: 1)
        view.backgroundColor = .darkGray
        view.addSubview(dismissUIButton)
        
        NSLayoutConstraint.activate([
            dismissUIButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissUIButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    func dismissViewControllerB() {
        dismiss(animated: true)
    }
}

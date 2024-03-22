//
//  CeldaContenido.swift
//  ContenidoAZT
//
//  Created by Abel Gonzalez on 31/08/22.
//

import UIKit

class CellContent: UITableViewCell {
    
    @IBOutlet weak var cellContent: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

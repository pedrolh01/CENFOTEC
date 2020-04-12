//
//  AnimalTableViewCell.swift
//  AsignacionAdicional
//
//  Created by Felix F on 4/11/20.
//  Copyright © 2020 Pedro Ledezma. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var lbProvincia: UILabel!
    @IBOutlet weak var lbNombre: UILabel!

    @IBOutlet weak var imagenAnimal: UIImageView!
    @IBOutlet weak var lbTelefono: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(animal: Animal) {
        lbProvincia.text = "Provincia: \(animal.provincia)"
        lbNombre.text   = "Contacto: \(animal.nombre)"
        lbTelefono.text = "Telefono: \(animal.telefono)" 
        imagenAnimal.image = UIImage(named: animal.animal)
    }
    
}

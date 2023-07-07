//
//  ConfigurationTableViewCell.swift
//  Practica_TEMPORIZADOR
//
//  Created by Administrator on 07/07/23.
//

import UIKit

class ConfigurationTableViewCell: UITableViewCell {
    
    var labelConfiguration: UILabel = {
        let label = UILabel()
        label.text = "Vibracion y Sonido"
        label.textColor = .white
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        label.textAlignment = .center
        return label
    }()
        
    var imageViewCheckbox: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "circle")
        return imageView
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        addSubview(imageViewCheckbox)
        imageViewCheckbox.addAnchorsAndSize(width: 50, height: 50, left: 10, top: 2, right: nil, bottom: 2)
        
        addSubview(labelConfiguration)
        labelConfiguration
    }
    
    func configure(modelCheck: checkbox){
        imageViewCheckbox.image = UIImage(systemName: modelCheck.imageName)
        labelConfiguration.text = modelCheck.title
        
    }

}

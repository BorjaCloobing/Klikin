//
//  CommerceTableViewCell.swift
//  Klikin
//
//  Created by Borja Rodriguez Sánchez on 5/7/17.
//  Copyright © 2017 Borja Rodriguez Sánchez. All rights reserved.
//

import UIKit

class CommerceTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imageGradientLayer: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        let background = CAGradientLayer().blackColor()
        background.frame = imageGradientLayer.bounds
        imageGradientLayer.layer.insertSublayer(background, at: 0)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        galleryImageView.hnk_cancelSetImage()
        galleryImageView.image = nil
    }

}

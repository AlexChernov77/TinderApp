//
//  FVGirlViewCell.swift
//  fevronia
//
//  Created by Александр Чернов on 10.12.2017.
//  Copyright © 2017 Александр Чернов. All rights reserved.
//

import UIKit
import SDWebImage

class FVGirlViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    @IBOutlet weak var fapPhotoImageView: UIImageView!
    
    func configureSelf (imageUrl: String) {
        fapPhotoImageView.sd_setImage(with: URL(string: imageUrl))
    }
}

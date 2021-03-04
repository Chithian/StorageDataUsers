//
//  ImageCollectionViewCell.swift
//  Users Storage&Data
//
//  Created by Chithian on 3/3/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView.layer.cornerRadius = 10
    }
    

}

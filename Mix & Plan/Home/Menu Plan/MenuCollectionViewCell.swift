//
//  MenuCollectionViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var menuImg: UIImageView!
    @IBOutlet weak var menuLbl: UILabel!
    
    override func awakeFromNib() {
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 2.5
        self.contentView.layer.borderColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0).cgColor
    }
}

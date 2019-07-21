//
//  MenuHomeCollectionViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit
import CoreData

class MenuHomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var HomeMenuImg: UIImageView!
    @IBOutlet weak var HomeMenuLbl: UILabel!
    @IBOutlet weak var addMenuPBtn: UIButton!
    
    var category:String = ""
    
    override func awakeFromNib() {
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 2.5
        self.contentView.layer.borderColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0).cgColor
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

}

//
//  ShopListTableViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class ShopListTableViewCell: UITableViewCell {

    @IBOutlet weak var itemNameLbl: UILabel!
    @IBOutlet weak var itemAmountLbl: UILabel!
    @IBOutlet weak var checkboxOutlet: UIButton!
    
    var row:Int!
    var delegate:deletecell!
    
    @IBAction func checkboxAction(_ sender: Any) {
        checkboxOutlet.isSelected = !checkboxOutlet.isSelected
        delegate.deletecellfunc(row: row)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 2.5
        self.contentView.layer.borderColor = UIColor(red: 255/255.0, green: 129/255.0, blue: 38/255.0, alpha: 100.0).cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

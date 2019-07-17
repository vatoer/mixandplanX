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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

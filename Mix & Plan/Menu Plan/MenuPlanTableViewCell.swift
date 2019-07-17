//
//  MenuPlanTableViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class MenuPlanTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var menus = ["Nasi Goreng Ayam", "Penne Carbonara", "Miso Soup"]

    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var MenuPlanCollView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        MenuPlanCollView.delegate = self
        MenuPlanCollView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        menuCell.menuImg.image = UIImage(named: "satu")
        menuCell.menuLbl.text = menus[indexPath.row]
        
        return menuCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // performSegue(withIdentifier: "planShowRecipe", sender: self)
        
    }
    

}

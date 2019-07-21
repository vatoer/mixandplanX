//
//  MenuPlanTableViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit
import CoreData

class MenuPlanTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //menus nya narik dari coredata recipePlan
    var recipes : [Recipe] = []
    var menus = ["Nasi Goreng Ayam", "Penne Carbonara", "Miso Soup"]
    
    let mp_vc = MenuPlanViewController()

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
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menu_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        
        //datanya diambil dari si core datanya
        menu_Cell.menuImg.image = UIImage(named: "western")
        menu_Cell.menuLbl.text = menus[indexPath.row]
        //add target kalo button delete (x) nya di klik nanti menu nya hilang
        
        return menu_Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // performSegue(withIdentifier: "planShowRecipe", sender: self)
        
    }
    

}

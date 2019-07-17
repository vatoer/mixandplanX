//
//  CuisineTableViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class CuisineTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var cuisineImg: UIImageView!
    @IBOutlet weak var cuisineLbl: UILabel!
    @IBOutlet weak var dispMenuList: UICollectionView!
    
    let menuNames = ["Lasagna", "Pasta", "Fish and Chips"]
    let images = ["satu", "satu", "satu", "satu"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "menuCuisineCell", for: indexPath) as! MenuHomeCollectionViewCell
        menuCell.HomeMenuImg.image = UIImage(named: images[indexPath.row])
        menuCell.HomeMenuLbl.text = menuNames[indexPath.row]
        
        return menuCell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dispMenuList.delegate = self
        dispMenuList.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

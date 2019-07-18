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
    
    var recipes:[RecipeModel]=[]
    var searchResults: [RecipeModel] = []
    let queryService = QueryService()
    
    //bagaimana akses menuNames ini dari veiw
    let menuNames = ["Lasagna", "Pasta", "Fish and Chips"]
    let images = ["satu", "satu", "satu", "satu"]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuNames.count
    }
    
    //TODO
    //harusnya ke sini hasil resepnya
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "menuCuisineCell", for: indexPath) as! MenuHomeCollectionViewCell
        menuCell.HomeMenuImg.image = UIImage(named: images[indexPath.row])
        menuCell.HomeMenuLbl.text = menuNames[indexPath.row]
        
        //TODO pisahkan perkategori
        //menuCell.HomeMenuLbl.text = searchResults[0].name
        
        print("searchResults====")
        for xresult in searchResults {
            print(xresult.id)
        }
        print(searchResults.count)
        print("====searchResults")
        
        return menuCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "homeShowRecipe", sender: self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        loadRecipe()
        dispMenuList.delegate = self
        dispMenuList.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadRecipe(){
        // Do any additional setup after loading the view.
        queryService.getRecipe(){ results, errorMessage in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let results = results {
                self.searchResults = results
                self.dispMenuList.reloadData()
//                self.CategoryTblView.setContentOffset(CGPoint.zero, animated: false)
            }
            if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
        };
    }
    
    

}

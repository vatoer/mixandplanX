//
//  CuisineTableViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit
import CoreData

//https://docs.swift.org/swift-book/LanguageGuide/Protocols.html
//protocol ini akan digunakan sebagai penghubung CuisineTableViewCell dengan ViewController parentnya
protocol CuisineTableViewCellClick {
    func itemClick(index: Int)
    func recipeClick(recipe: RecipeModel)
}

class CuisineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cuisineImg: UIImageView!
    @IBOutlet weak var cuisineLbl: UILabel!
    @IBOutlet weak var dispMenuList: UICollectionView!
    
    let vc = ViewController()
    let collView = MenuHomeCollectionViewCell()
    
    //define cellProtocol
    //akan dipanggil ketika didselect
    var cellProtocol: CuisineTableViewCellClick?
    
    var category:String = "not available"
    
    var row: Int = 0
    var searchResults: [RecipeModel] = []
   // let queryService = QueryService()
    var i: Int = 0
    var y: Int = 0
    
    var recipes: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //loadRecipe()
        //print("ini row",self.searchResults)
        dispMenuList.delegate = self
        dispMenuList.dataSource = self
    }
    
    
}

extension CuisineTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate,
UIViewControllerTransitioningDelegate{
    
//    @objc func addMenuToPlan(sender: UIButton){
//        if i < 7 {
//            if y < 5 {
//                collView.addMenu()
//                print("y")
//                (y+1)
//            }
//            (i+1)
//        }
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        row = indexPath.row
        
        let menuCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "menuCuisineCell", for: indexPath) as! MenuHomeCollectionViewCell
        //menuCell.HomeMenuImg.image = UIImage(named: images[indexPath.row])
//        let url = searchResults[indexPath.row].imageURL
//        menuCell.HomeMenuImg.load(url: url)
//        menuCell.HomeMenuLbl.text = searchResults[indexPath.row].name
        //menuCell.addMenuPBtn.addTarget(self, action: #selector(addMenuToPlan(sender:)), for: .touchUpInside)
        
        if searchResults[indexPath.row].tag == category {
            let url = searchResults[indexPath.row].imageURL
            menuCell.HomeMenuImg.load(url: url)
            menuCell.HomeMenuLbl.text = searchResults[indexPath.row].name
            
        }
        else {
            print("bukan disini")
        }
        
        //TODO pisahkan perkategori
        return menuCell
    }
    
    //fungsi ini dipanggil ketika cell di pilih
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("#collectionView")
        //
        //cellProtocol?.itemClick(index: indexPath.row)
        cellProtocol?.recipeClick(recipe: searchResults[indexPath.row])
        
        //print(searchResults[0].name)
    }
    
//    func loadRecipe(tag: String){
//        print(#function)
//        // Do any additional setup after loading the view.
//        queryService.getRecipe(searchTerm: tag){ results, errorMessage in
//            UIApplication.shared.isNetworkActivityIndicatorVisible = false
//            if let results = results {
//                self.searchResults = results
//                self.dispMenuList.reloadData()
//            }
//            if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
//        };
//
//        //print(searchResults)
//    }
    

    }

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

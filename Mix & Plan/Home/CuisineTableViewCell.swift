//
//  CuisineTableViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

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
    

    
    //define cellProtocol
    //akan dipanggil ketika didselect
    var cellProtocol: CuisineTableViewCellClick?
    
    var category:String = "not available"
    
    var row: Int = 0
    var searchResults: [RecipeModel] = []
    let queryService = QueryService()
    var i: Int = 0
    //bagaimana akses menuNames ini dari veiw
    let menuNames = ["Lasagna", "Pasta", "Fish and Chips"]
    var recipes: [String] = []
    let images = ["satu", "satu", "satu", "satu","satu", "satu", "satu", "satu","satu", "satu", "satu", "satu","satu", "satu", "satu", "satu","satu", "satu", "satu", "satu"]
    
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        row = indexPath.row
        
        let menuCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "menuCuisineCell", for: indexPath) as! MenuHomeCollectionViewCell
        //menuCell.HomeMenuImg.image = UIImage(named: images[indexPath.row])
        let url = searchResults[indexPath.row].imageURL
        menuCell.HomeMenuImg.load(url: url)
        menuCell.HomeMenuLbl.text = searchResults[indexPath.row].name
        
        menuCell.addMenuPBtn.tag = indexPath.row
        menuCell.addMenuPBtn.addTarget(self, action: #selector(self.addButton), for: .touchUpInside)
        
        //TODO pisahkan perkategori
        return menuCell
    }
    
    @objc func addButton(sender: UIButton){
        print(sender.tag)
    }
    
    //fungsi ini dipanggil ketika cell di pilih
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("#collectionView")
        //
        //cellProtocol?.itemClick(index: indexPath.row)
        cellProtocol?.recipeClick(recipe: searchResults[indexPath.row])
        
        //print(searchResults[0].name)
    }
    
    func loadRecipe(){
        print(#function)
        print(category)
        
        //cellProtocol?.setCategory(category: <#T##String#>)
        // Do any additional setup after loading the view.
        queryService.getRecipe(searchTerm: category ){ results, errorMessage in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let results = results {
                self.searchResults = results
                self.dispMenuList.reloadData()
            }
            if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
        };
        
        //print(searchResults)
    }
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

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

class CuisineTableViewCell: UITableViewCell{
    
    @IBOutlet weak var cuisineImg: UIImageView!
    @IBOutlet weak var cuisineLbl: UILabel!
    @IBOutlet weak var dispMenuList: UICollectionView!
    
    var popUpView:UIView! = nil
    var blurEffect:UIVisualEffectView! = nil
    
    let vc = ViewController()
    
    //define cellProtocol
    //akan dipanggil ketika didselect
    var cellProtocol: CuisineTableViewCellClick?
    
    var category:String = "not available"
    
    var days: Int = 0
    var row: Int = 0
    
    var searchResults: [RecipeModel] = []
    let queryService = QueryService()
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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        row = indexPath.row
        
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
       // self.days = 0
        addMenu(rowAt: sender.tag)
        //ViewController().view.addSubview(blurEffect)
        //vc.CategoryTblView.addSubview(blurEffect)
        //vc.CategoryTblView.addSubview(blurEffect)
        //ViewController().view.addSubview(popUpView)
        //print(sender.tag)
    }
    
    //fungsi ini dipanggil ketika cell di pilih
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("#collectionView")
        //
        //cellProtocol?.itemClick(index: indexPath.row)
        cellProtocol?.recipeClick(recipe: searchResults[indexPath.row])
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
        
    }
    
    func addMenu(rowAt : Int){
        
        //add menu ke coredatanya berdasarkan days nya, add menu tambahin parameter days
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
        
            let re = Recipe(context: context)
        
            re.name = searchResults[rowAt].name
            re.id = searchResults[rowAt].id
            re.imageURL = searchResults[rowAt].imageURL.absoluteString
    //        re.instruction = recipe.instruction
            re.contributor = searchResults[rowAt].contributor
            re.days = Int16(days)
    
            do{
                try context.save()
            }catch{
                print("failed")
            }
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

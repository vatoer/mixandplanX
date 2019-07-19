//
//  ViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 12/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var CategoryTblView: UITableView!
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    var searchResults: [RecipeModel] = []
    let queryService = QueryService()
    
    //let cuisineCell = CuisineTableViewCell.self
    
    var row: Int?, rows: Int?
    var cuisine = ["Recomendation", "Indonesia", "Western", "Jepang","Chinese","Thai"]
    //TODO
    //bikin logo
    var cuisineLogo = ["pasar", "western", "western", "western","western", "western"]
    
    @IBAction func menuPlanBtn(_ sender: Any) {
        performSegue(withIdentifier: "showMenuPlan", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //belum di kategoriin sesuai cuisine
        
        CategoryTblView.delegate = self
        CategoryTblView.dataSource = self
        
    }
    
    func loadRecipe(){
        print(#function)
        // Do any additional setup after loading the view.
        queryService.getRecipe(searchTerm: "all"){ results, errorMessage in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let results = results {
                //print(#function)
                //print(results)
                self.searchResults = results
                
            }
            if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
        };
        
        //load indonesian food only
        
        //print(searchResults)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuisine.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 255
        }
        else{
            return 290
        }
    }
    
    
    //load datanya kemari
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        rows = indexPath.row
        //TODO
        //asumsu bahwa yg nomor record yang nomor 1 adalah selalu rekomendasi
        if indexPath.row == 0 {
            let recommenCell = tableView.dequeueReusableCell(withIdentifier: "recommendCell") as! RecommendTableViewCell
            recommenCell.recommendImg.image = UIImage(named: "chef")
            recommenCell.recommendLbl.text = "Fried Rice with chicken"
            
            return recommenCell
            
        }
        else {
            //print("cell disini")
            let cell = tableView.dequeueReusableCell(withIdentifier: "cuisineCell", for: indexPath) as! CuisineTableViewCell
            //cell.loadData(data: self.searchResults)
            cell.cuisineLbl.text = cuisine[indexPath.row]
            cell.cuisineImg.image = UIImage(named: cuisineLogo[indexPath.row])
            cell.category = cuisine[indexPath.row]
            cell.cellProtocol = self
            
            cell.searchResults = searchResults
            //            print("START searchResults disini")
            //            print(self.searchResults)
            //            print("END searchResults disini")
            //            cell.searchResults = self.searchResults
            //            cell.dispMenuList.reloadData()
            //for every category
            //print(self.searchResults)
            //cell.searchResults = self.searchResults
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "homeShowRecipe", sender: self)
        }
        else {
            performSegue(withIdentifier: "showCuisineAllMenu", sender: self)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCuisineAllMenu"{
            let dest = segue.destination as! AllMenuViewController
            dest.navigationItem.title = "\(cuisine[row!])"
            
        }
        if segue.identifier == "showRecipeFromHome"{
            let dest = segue.destination as! RecipeViewController
            //let index = sender as! Int
            let recipe = sender as! RecipeModel
            //cuisineCell.
            dest.recipe = recipe
            print("cak==========")
            print( recipe.name )
            print("cuk==========")
        }
    }
    
}

extension ViewController: CuisineTableViewCellClick {
    func recipeClick(recipe: RecipeModel) {
        performSegue(withIdentifier: "showRecipeFromHome", sender: recipe)
        //print("#recipeClick")
        //print(self.selectedRecipe?.name)
    }
    
    func itemClick(index: Int) {
        //performSegue(withIdentifier: "showRecipeFromHome", sender: index)
    }
    
}


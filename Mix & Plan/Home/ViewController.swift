//
//  ViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 12/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var homeSearchBar: UISearchBar!
    @IBOutlet weak var CategoryTblView: UITableView!
    lazy var tapRecognizer: UITapGestureRecognizer = {
        var recognizer = UITapGestureRecognizer(target:self, action: #selector(dismissKeyboard))
        return recognizer
    }()
    
    var searchResults: [RecipeModel] = []
    let queryService = QueryService()
    
    var row: Int?
    var cuisine = ["pasar", "Western Food", "Indonesian Food", "Japanese Food", "Western2 Food", "2Indonesian Food", "2Japanese Food","pasar", "Western Food", "Indonesian Food", "Japanese Food", "Western2 Food", "2Indonesian Food", "2Japanese Food"]
    var cuisineLogo = ["pasar", "western", "western", "western","pasar", "western", "western", "western","pasar", "western", "western", "western","pasar", "western", "western", "western","pasar", "western", "western", "western","pasar", "western", "western", "western"]
    
    @IBAction func menuPlanBtn(_ sender: Any) {
        performSegue(withIdentifier: "showMenuPlan", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadRecipe()
        setUpNavigationBarItem()
        
        CategoryTblView.delegate = self
        CategoryTblView.dataSource = self
    }
    
    func loadRecipe(){
        // Do any additional setup after loading the view.
        queryService.getRecipe(){ results, errorMessage in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let results = results {
                self.searchResults = results
                self.CategoryTblView.reloadData()
                self.CategoryTblView.setContentOffset(CGPoint.zero, animated: false)
            }
            if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
        };
    }
    
    func setUpNavigationBarItem(){
        let logo = UIImage(named: "logo-icon")
        let navImageView = UIImageView(image: logo)
        self.navigationItem.titleView = navImageView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cuisine.count
        //return searchResults.count
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
        var i:Int=0
        //TODO
        //asumsu bahwa yg nomor record yang nomor 1 adalah selalu rekomendasi
        if indexPath.row == 0 {
            let recommenCell = tableView.dequeueReusableCell(withIdentifier: "recommendCell") as! RecommendTableViewCell
            recommenCell.recommendImg.image = UIImage(named: "pasar")
            recommenCell.recommendLbl.text = "Fried Rice with chicken"
            
            return recommenCell
            
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cuisineCell", for: indexPath) as! CuisineTableViewCell
            cell.cuisineLbl.text = cuisine[indexPath.row]
            cell.cuisineImg.image = UIImage(named: cuisineLogo[indexPath.row])
            
            //for every category
            //print(self.searchResults)
            cell.recipes = self.searchResults
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
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
    }
    
}


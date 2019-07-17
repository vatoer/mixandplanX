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
    
    
    var row: Int?
    var cuisine = ["pasar", "Western Food", "Indonesian Food", "Japanese Food"]
    var cuisineLogo = ["pasar", "western", "western", "western"]
    
    @IBAction func menuPlanBtn(_ sender: Any) {
        performSegue(withIdentifier: "showMenuPlan", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CategoryTblView.delegate = self
        CategoryTblView.dataSource = self
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row = indexPath.row
        performSegue(withIdentifier: "showCuisineAllMenu", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCuisineAllMenu"{
            let dest = segue.destination as! AllMenuViewController
            dest.navigationItem.title = "\(cuisine[row!])"
            
        }
    }
    
}


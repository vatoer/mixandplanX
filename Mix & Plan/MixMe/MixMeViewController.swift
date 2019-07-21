//
//  MixMeViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class MixMeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var searchIngredients: UISearchBar!
    @IBOutlet weak var ingredientsCollView: UICollectionView!
    
    var ingredientName = ["Chicken", "Beef", "Salmon", "Tomato", "Egg", "Carrot", "Broccoli"]
    
    var ingredient:[Ingredients] = [Ingredients(name: "Chicken", image: "", selected: false),Ingredients(name: "Beef", image: "", selected: false),Ingredients(name: "Fish", image: "", selected: false),Ingredients(name: "Tomato", image: "", selected: false),Ingredients(name: "Egg", image: "", selected: false),Ingredients(name: "Carrot", image: "", selected: false),Ingredients(name: "Broccoli", image: "", selected: false)]
    
    @IBAction func mixMeBtn(_ sender: Any) {
        performSegue(withIdentifier: "showMixMeMenuResult", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ingredientsCollView.delegate = self
        ingredientsCollView.dataSource = self
       
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredientName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let ingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ingredientCell", for: indexPath) as! IngredientsCollectionViewCell
        ingCell.dispIngredientImg.image = UIImage(named: "satu")
        ingCell.ingredientLbl.text = ingredient[indexPath.row].name
        
        let ing = ingredient[indexPath.row]
        
        if ing.selected{
            ingCell.layer.borderColor = UIColor(red: 255/255.0, green: 129/255.0, blue: 38/255.0, alpha: 100.0).cgColor
            ingCell.layer.borderWidth = 4
        }
        else{
            ingCell.layer.borderColor = UIColor.clear.cgColor
        }
        
        
        return ingCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ingredient[indexPath.row].selected = !ingredient[indexPath.row].selected
        for ing in ingredient{
            if ing.selected{
                break
            }
        }
        collectionView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

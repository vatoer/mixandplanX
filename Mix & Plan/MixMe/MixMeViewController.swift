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
        ingCell.ingredientLbl.text = ingredientName[indexPath.row]
        
        return ingCell
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

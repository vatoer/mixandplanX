//
//  AllMenuViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 17/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class AllMenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var menuNameOpt: [String] = []
    var menuImgName: [String] = []
    var recipes: [RecipeModel] = []
    
    let mix_vc = MixMeViewController()
    
    var selected: [Ingredients] = []
    
    var availMen:[Menus] = []
    
    @IBOutlet weak var allMenuCollView: UICollectionView!
    
    var optMenu: [Menus] = [Menus(name: "Fried Rice", image: "fried rice", ingredients: ["Chicken", "Rice", "Onion"], instructions: ["", ""]), Menus(name: "Satay", image: "satay", ingredients: ["Chicken", "Onion", "Peanut"], instructions: ["", ""]), Menus(name: "Chicken Soto Soup", image: "soto", ingredients: ["Chicken", "Carrot", "Garlic", "Salt"], instructions: ["",""]), Menus(name: "Fried Chicken", image: "fried chicken", ingredients: ["Chicken", "Egg"], instructions: ["", ""]), Menus(name: "Sunny Side Egg", image: "sunny egg", ingredients: ["Egg", ""], instructions: ["",""]), Menus(name: "Steak", image: "steak", ingredients: ["Beef", "Salt", "Pepper", "Butter"], instructions: ["", ""]), Menus(name: "Beef Yakiniku", image: "beef yakiniku", ingredients: ["Beef", "Onion", "Pepper"], instructions: ["",""]), Menus(name: "Tamagoyaki", image: "tamagoyaki", ingredients: ["Egg", "Soy Sauce"], instructions: ["", ""]), Menus(name: "Stir Fry Pak Choy", image: "sawi", ingredients: ["Bok Choy", "peppr"], instructions: ["", ""]), Menus(name: "Yolk Egg Prawn", image: "udang salted", ingredients: ["Prawn", "Egg", "Tapioca Flour", "Oil"], instructions: ["", ""]) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hidesBottomBarWhenPushed = true
        allMenuCollView.delegate = self
        allMenuCollView.dataSource = self
        createMenuList()
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return availMen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let allMenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "allMenuCell", for: indexPath) as! AllMenuCollectionViewCell
        allMenuCell.allMenuLbl.text = availMen[indexPath.row].name
        allMenuCell.allMenuImg.image = UIImage(named: availMen[indexPath.row].image)
        return allMenuCell
    }
    
    func createMenuList(){
        for menu in optMenu{
            for ing in menu.ingredients{
                for i in 0..<selected.count{
                    print(selected[i].name)
                    if (ing == selected[i].name){
                        availMen.append(menu)
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "menuShowRecipe", sender: self)
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

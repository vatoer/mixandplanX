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
    
    var availMen:[String] = []
    
    @IBOutlet weak var allMenuCollView: UICollectionView!
    
    var optMenu: [Menus] = [Menus(name: "Fried Rice", image: "", ingredients: ["Chicken", "Rice", "Onion"], instructions: ["", ""]), Menus(name: "Satay", image: "", ingredients: ["Chicken", "Onion", "Peanut"], instructions: ["", ""]), Menus(name: "Chicken Soto Soup", image: "", ingredients: ["Chicken", "Carrot", "Garlic", "Salt"], instructions: ["",""]), Menus(name: "Fried Chicken", image: "", ingredients: ["Chicken", "Egg"], instructions: ["", ""]), Menus(name: "Sunny Side Egg", image: "", ingredients: ["Egg", ""], instructions: ["",""]), Menus(name: "Steak", image: "", ingredients: ["Beef", "Salt", "Pepper", "Butter"], instructions: ["", ""]), Menus(name: "Beef Yakiniku", image: "", ingredients: ["Beef", "Onion", "Pepper"], instructions: ["",""]), Menus(name: "Tamagoyaki", image: "", ingredients: ["Egg", "Soy Sauce"], instructions: ["", ""]), Menus(name: "Stir Fry Pak Choy", image: "", ingredients: ["Bok Choy", "peppr"], instructions: ["", ""]), Menus(name: "Yolk Egg Prawn", image: "", ingredients: ["Prawn", "Egg", "Tapioca Flour", "Oil"], instructions: ["", ""]) ]
    
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
        allMenuCell.allMenuLbl.text = availMen[indexPath.row]
        return allMenuCell
    }
    
    func createMenuList(){
        for menu in optMenu{
            for ing in menu.ingredients{
                for i in 0..<selected.count{
                    print(selected[i].name)
                    if (ing == selected[i].name){
                        availMen.append(menu.name)
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

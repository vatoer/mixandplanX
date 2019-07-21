//
//  MenuViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 22/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var MenuCollView: UICollectionView!
    
    var menus: [RecipeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        MenuCollView.delegate = self
        MenuCollView.dataSource = self
        
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menusCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cuisineMenuCell", for: indexPath) as! CuisineMenuCollectionViewCell
        
                menusCell.cMenuLbl.text = menus[indexPath.row].name
        
        return menusCell
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

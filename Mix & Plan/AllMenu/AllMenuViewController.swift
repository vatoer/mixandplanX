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
    
    @IBOutlet weak var allMenuCollView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allMenuCollView.delegate = self
        allMenuCollView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let allMenuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "allMenuCell", for: indexPath) as! MenuHomeCollectionViewCell
        
        return allMenuCell
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

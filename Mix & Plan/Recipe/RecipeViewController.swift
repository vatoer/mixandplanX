//
//  RecipeViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 17/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    //var recipe:Int = 0
    var recipe:RecipeModel?
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBAction func startBtn(_ sender: Any) {
        performSegue(withIdentifier: "showStartCooking", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        self.navigationItem.title = ""
        
        // Do any additional setup after loading the view.
        
        //recipeImageView.load(url: recipe?.imageURL ?? URL(string: "https://via.placeholder.com/728x90.png?text=Visit+WhoIsHostingThis.com+Buyers+Guide")!)
//        guard let url = recipe?.imageURL else { return }
//        recipeImageView.load(url: url)
        recipeImageView.image = UIImage(named: "nasi goreng")
        recipeNameLabel.text = recipe?.name
        
        
        
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


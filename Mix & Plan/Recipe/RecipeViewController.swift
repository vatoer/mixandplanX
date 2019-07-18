//
//  RecipeViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 17/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    @IBAction func startBtn(_ sender: Any) {
        performSegue(withIdentifier: "showStartCooking", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)

        // Do any additional setup after loading the view.
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

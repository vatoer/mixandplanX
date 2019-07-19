//
//  MenuHomeCollectionViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit
import CoreData

class MenuHomeCollectionViewCell: UICollectionViewCell {
    

    var recipe: RecipeModel!
     var i = 0
     var y = 0
    
    @IBOutlet weak var HomeMenuImg: UIImageView!
    @IBOutlet weak var HomeMenuLbl: UILabel!
    @IBOutlet weak var addMenuPBtn: UIButton!
    
    var category:String = ""
    
    override func awakeFromNib() {
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.layer.borderWidth = 2.5
        self.contentView.layer.borderColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0).cgColor
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
//    func addMenu(){
//
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
////        let entity = NSEntityDescription.entity(forEntityName: "RecipePlan", in: context)
////        let manageObj = NSManagedObject(entity: entity!, insertInto: context)
////
////        manageObj.setValue(HomeMenuLbl.text, forKey: "name")
////        manageObj.setValue(i, forKey: "days")
////        manageObj.setValue(y, forKey: "optNumber")
//
////            var re = Recipe(context: context)
////        re.name = recipe.name
////        re.id = recipe.id
////        re.imageURL = recipe.imageURL.absoluteString
//////        re.instruction = recipe.instruction
////        re.contributor = recipe.contributor
//
//        do{
//            try context.save()
//        }catch{
//
//        }
//    }

}

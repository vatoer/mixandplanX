//
//  MenuPlanTableViewCell.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit
import CoreData

class MenuPlanTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //menus nya narik dari coredata recipePlan
    var recipes : [Recipe] = []
    var menus = ["Nasi Goreng Ayam", "Penne Carbonara", "Miso Soup"]
    let img : [String] = ["fried rice", "satay", "soto", "fried chicken", "sunny egg", "steak", "beef yakiniku", "tamagoyaki", "sawi", "udang salted"]
    
    let mp_vc = MenuPlanViewController()

    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var MenuPlanCollView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadData()
        // Initialization code
        MenuPlanCollView.delegate = self
        MenuPlanCollView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menu_Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        
        //datanya diambil dari si core datanya
        menu_Cell.menuLbl.text = recipes[indexPath.row].name
        
        if menu_Cell.menuLbl.text == "Fried Rice" { menu_Cell.menuImg.image = UIImage(named: "fried rice")}
        else if menu_Cell.menuLbl.text == "Satay" { menu_Cell.menuImg.image = UIImage(named: "satay")}
        else if menu_Cell.menuLbl.text == "Chicken Soto Soup" { menu_Cell.menuImg.image = UIImage(named: "soto")}
        else if menu_Cell.menuLbl.text == "Steak" { menu_Cell.menuImg.image = UIImage(named: "steak") }
        else if menu_Cell.menuLbl.text == "Friend Chicken" { menu_Cell.menuImg.image = UIImage(named: "fried chicken") }
        else if menu_Cell.menuLbl.text == "Sunny Side Egg" { menu_Cell.menuImg.image = UIImage(named: "sunny egg") }
        else if menu_Cell.menuLbl.text == "Tamagoyaki" { menu_Cell.menuImg.image = UIImage(named: "tamagoyaki") }
        else if menu_Cell.menuLbl.text == "Beef Yakiniku" { menu_Cell.menuImg.image = UIImage(named: "beef yakiniku") }
        else if menu_Cell.menuLbl.text == "Stir Fry Pak Choy" { menu_Cell.menuImg.image = UIImage(named: "sawi") }
        else if menu_Cell.menuLbl.text == "Yolk Egg Prawn" { menu_Cell.menuImg.image = UIImage(named: "udang salted") }
        
        
        menu_Cell.deleteBtn.tag = indexPath.row
        //add target kalo button delete (x) nya di klik nanti menu nya hilang
        menu_Cell.deleteBtn.addTarget(self, action: #selector(deleteMenuPlan), for: .touchUpInside)
        
        
        return menu_Cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // performSegue(withIdentifier: "planShowRecipe", sender: self)
        
    }
    
    @objc func deleteMenuPlan(sender :UIButton){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let id = recipes[sender.tag].id
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
        fetchReq.predicate = NSPredicate(format: "id = %@", id!)
        
        do {
            let test = try context.fetch(fetchReq)
            let objToDelete = test[0] as! NSManagedObject
            context.delete(objToDelete)
            do {
                try context.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        loadData()
    }
    
    func loadData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        do{
            recipes = try context.fetch(Recipe.fetchRequest())
        }catch{
            print("error")
        }
        MenuPlanCollView.reloadData()
    }

}

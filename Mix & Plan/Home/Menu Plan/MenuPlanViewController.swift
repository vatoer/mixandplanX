//
//  MenuPlanViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit
import CoreData

class MenuPlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuPlanList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //loadData()
        
        let replanBtn = UIBarButtonItem(title: "Re-plan", style: .plain, target: self, action: #selector(replanMenu))
        
        self.navigationItem.rightBarButtonItem = replanBtn
        
        menuPlanList.delegate = self
        menuPlanList.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //kalo data di coredatanya ga empty, baru tampilin list day nya
        return 7
        
        //kalo coredatanya empty, tampilin "you currently don't have any food plan yet"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuPCell = tableView.dequeueReusableCell(withIdentifier: "menuPlanCell", for: indexPath) as! MenuPlanTableViewCell
        menuPCell.dayLbl.text = "Day \(indexPath.row+1)"
        
        
        return menuPCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    
    @objc func replanMenu(){
        
        //hapus semua collection view cell nya
        
        deleteAll()
    }

    
    func deleteAll(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Recipe")
       
    
        do {
            let test = try context.fetch(fetchReq)
            for i in 0..<test.count {
                let objToDelete = test[i] as! NSManagedObject
                context.delete(objToDelete)
            }
            do {
                try context.save()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
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

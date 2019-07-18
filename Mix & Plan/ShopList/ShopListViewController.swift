//
//  ShopListViewController.swift
//  Mix & Plan
//
//  Created by aurelia  natasha on 16/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import UIKit

class ShopListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource ,deletecell{
    func deletecellfunc(row: Int, status:Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.shopListTableView.beginUpdates()
            if status {
                self.alreadybought.append(self.datas[row])
                self.datas.remove(at: row)
            }else{
                self.datas.append(self.alreadybought[row])
                self.alreadybought.remove(at: row)
            }
            
//            let indexpath = IndexPath(row: row, section: 0)
//            self.shopListTableView.deleteRows(at: [indexpath], with: .left)
//            self.shopListTableView.endUpdates()
            self.shopListTableView.reloadData()
        }
        
    }
    
    
    @IBOutlet weak var shopListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
    }
    
    
    @IBAction func SelectButtonAction(_ sender: Any) {
    }
    @IBOutlet weak var SelectButtonOutlet: UIBarButtonItem!
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "To Buy"
            
        }else{
            return "Bought"
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return datas.count
            
        }else{
            return alreadybought.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shopCell = tableView.dequeueReusableCell(withIdentifier: "shopListCell", for: indexPath) as! ShopListTableViewCell
        shopCell.delegate = self
        shopCell.row = indexPath.row
        
        
        if indexPath.section == 0 {
            shopCell.itemNameLbl.text = datas[indexPath.row]
            shopCell.checkboxOutlet.isSelected = false
        }else{
            shopCell.itemNameLbl.text = alreadybought[indexPath.row]
            shopCell.checkboxOutlet.isSelected = true
        }
        
        
        return shopCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
    var alreadybought:[String] = []
    var datas:[String] = ["Beef","ikan","ayam","timun","kentang","minyak","bawang"]
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

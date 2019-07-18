//
//  SearchVCandDelegate.swift
//  Mix & Plan
//
//  Created by fathur rohman on 17/07/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//
import Foundation
import UIKit
extension ViewController: UISearchBarDelegate {
    
    @objc func dismissKeyboard() {
        homeSearchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        queryService.getRecipe(searchTerm: searchText) { results, errorMessage in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            if let results = results {
                self.searchResults = results
                //self.tableView.reloadData()
                //self.tableView.setContentOffset(CGPoint.zero, animated: false)
            }
            if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
        }
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    //    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    //        view.addGestureRecognizer(tapRecognizer)
    //    }
    //
    //    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    //        view.removeGestureRecognizer(tapRecognizer)
    //    }
}

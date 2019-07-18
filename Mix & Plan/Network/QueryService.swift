//
//  QueryService.swift
//  mc2cooking
//
//  Created by fathur rohman on 16/07/19.
//  Copyright © 2019 fathur rohman. All rights reserved.
//
import Foundation

// Runs query data task, and stores results in array of Recipes
class QueryService {
    
    typealias JSONDictionary = [String: Any]
    typealias QueryResult = ([RecipeModel]?, String) -> ()
    
    var recipes: [RecipeModel] = []
    var ingredients: [IngredientModel] = []
    var errorMessage = ""
    
    // TODO
    // 1
    let defaultSession = URLSession(configuration: .default)
    // 2
    var dataTask: URLSessionDataTask?
    
    
    //get request Recipe
    //
    func getRecipe(completion: @escaping QueryResult)  {
        //0
        print("getRecipe")
        // 1
        dataTask?.cancel()
        //2
        //string url data https://itunes.apple.com/search
        if var urlComponents = URLComponents(string: "https://pastebin.com/raw/SLq7cCmr") {
            //urlComponents.query = "media=music&entity=song&term=tes"
            // 3
            guard let url = urlComponents.url else { return }
            // 4
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // 5
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    //read data
                    print("sini coy")
                    self.parseRecipeJsonResults(data)
                    //
                    DispatchQueue.main.async {
                        completion(self.recipes, self.errorMessage)
                    }
                }
            }
            // 7
            dataTask?.resume()
        }
    }
    
    //search recipe
    fileprivate func parseRecipeJsonResults(_ data: Data) {
        
        var response: JSONDictionary?
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
        
        
        guard let resultResponse = response!["recipes"] as? [Any] else {
            errorMessage += "Dictionary does not contain results key\n"
            return
        }
        //print(resultResponse)
        
        var index = 0
        for dictionary in resultResponse {
            if let recipeDictionary = dictionary as? JSONDictionary,
                let id = recipeDictionary["id"] as? String ,
                let name = recipeDictionary["name"] as? String,
                let imageURL = URL(string: recipeDictionary["imageURL"] as! String),
                let contributor = recipeDictionary["contributor"] as? String,
                let instructions = recipeDictionary["instructions"] as? [String] {
                print(id,imageURL,instructions)
                recipes.append(RecipeModel(id: id  , name: name , contributor: contributor , imageURL: imageURL, instruction: instructions ))
                index += 1
                //print(recipes.count)
                //print(id)
            } else {
                errorMessage += "Problem parsing recipeDictionary\n"
            }
        }
    }
    
    func getSearchResults(searchTerm: String, completion: @escaping QueryResult) {
        // 1
        dataTask?.cancel()
        // 2
        // string url data https://itunes.apple.com/search
        // diganti dengan punya kita ntr, harusnya back end searh, tp dibikin aja fake JSON
        //
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(searchTerm)"
            // 3
            guard let url = urlComponents.url else { return }
            // 4
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // 5
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self.updateSearchResults(data)
                    // 6
                    DispatchQueue.main.async {
                        completion(self.recipes, self.errorMessage)
                    }
                }
            }
            // 7
            dataTask?.resume()
        }
    }
    
    
    
    //search recipe
    fileprivate func updateSearchResults(_ data: Data) {
        var response: JSONDictionary?
        recipes.removeAll()
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
        
        guard let arrayRecipe = response!["results"] as? [Any] else {
            errorMessage += "Dictionary does not contain results key\n"
            return
        }
        var index = 0
        for recipeDictionary in arrayRecipe {
            if let recipeDictionary = recipeDictionary as? JSONDictionary,
                let id = recipeDictionary["id"] as? String,
                let name = recipeDictionary["recipe"] as? String,
                let contributor = recipeDictionary["contributor"] as? String,
                let imageURLString = recipeDictionary["imageURL"] as? String,
                let imageURL = URL(string: imageURLString),
                let instruction = recipeDictionary["instruction"] as? [String] {
                recipes.append(RecipeModel(id: id, name: name, contributor: contributor, imageURL: imageURL, instruction: instruction))
                index += 1
            } else {
                errorMessage += "Problem parsing recipeDictionary\n"
            }
        }
    }
    
    
    func getRecipeIngredients(recipeId: Int, completion: @escaping QueryResult) {
        // 1
        dataTask?.cancel()
        // 2
        // string url data https://itunes.apple.com/search
        // diganti dengan punya kita ntr, harusnya back end searh, tp dibikin aja fake JSON
        //
        if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
            urlComponents.query = "media=music&entity=song&term=\(recipeId)"
            // 3
            guard let url = urlComponents.url else { return }
            // 4
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                // 5
                if let error = error {
                    self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
                } else if let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    self.updateRecipeIngredients(recipeId: recipeId, data)
                    // 6
                    DispatchQueue.main.async {
                        completion(self.recipes, self.errorMessage)
                    }
                }
            }
            // 7
            dataTask?.resume()
        }
    }
    
    
    //find recipeIngredient
    fileprivate func updateRecipeIngredients(recipeId: Int, _ data: Data) {
        var response: JSONDictionary?
        recipes.removeAll()
        
        do {
            response = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary
        } catch let parseError as NSError {
            errorMessage += "JSONSerialization error: \(parseError.localizedDescription)\n"
            return
        }
        
        guard let arrayRecipeIngredients = response!["results"] as? [Any] else {
            errorMessage += "Dictionary does not contain results key\n"
            return
        }
        var index = 0
        for recipeIngredientsDictionary in arrayRecipeIngredients {
            if let recipeIngredientsDictionary = recipeIngredientsDictionary as? JSONDictionary,
                let id = recipeIngredientsDictionary["id"] as? String,
                let name = recipeIngredientsDictionary["recipe"] as? String,
                let imageURLString = recipeIngredientsDictionary["imageURL"] as? String,
                let imageURL = URL(string: imageURLString),
                let unit = recipeIngredientsDictionary["unit"] as? String,
                let amount = recipeIngredientsDictionary["amount"] as?Float {
                
                let ingredient = IngredientModel(id: id, name: name, imageURL: imageURL, unit: unit, amount: amount)
                //TODO
                //masukin ingredient ke database
                ingredients.append(ingredient)
                index += 1
                //
                
            } else {
                errorMessage += "Problem parsing recipeDictionary\n"
            }
        }
    }
    
}

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
    
        let cuisine = ["Recomendation":"md7T8Bgb", "Indonesian":"WPEgKA3e", "Western":"aE9Vskqz", "Jepang":"rmHLjUcF","Chinese":"Fr1dHK9q","Thai":"4F60xEyE"]
    
    // TODO
    // 1
    let defaultSession = URLSession(configuration: .default)
    // 2
    var dataTask: URLSessionDataTask?
    
    
    //get request Recipe
    //
    //func getRecipe(completion: @escaping QueryResult)  {
    func getRecipe(searchTerm: String, completion: @escaping QueryResult)  {
        //0
        var code: String = "WPEgKA3e"
        switch searchTerm {
        case "Indonesia":
             code = "WPEgKA3e"
        case "Western":
            code = "aE9Vskqz"
        case "Jepang":
            code = "rmHLjUcF"
        case "Chinese":
            code = "Fr1dHK9q"
        case "Thai":
            code = "4F60xEyE"
        default:
             code = "RrbWadFU"
        }
        
        print(searchTerm)
        
        //
        
        
        let pasteBinUrl = "https://pastebin.com/raw/\(code)"
        print("pasteBinUrl",pasteBinUrl)
        
        //print("getRecipe")
        // 1
        dataTask?.cancel()
        //2
        //string url data https://itunes.apple.com/search
        if var urlComponents = URLComponents(string: pasteBinUrl ) {
            urlComponents.query = "tag=\(searchTerm)&entity=song&term=tes"
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
                    //print("sini coy")
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
                let name = recipeDictionary["Recipe_Name"] as? String,
                let imageURL = URL(string: recipeDictionary["url"] as! String),
                let tag = recipeDictionary["tag"] as? String,
                let contributor = recipeDictionary["contributor"] as? String,
                let instructions = recipeDictionary["instruction"] as? [String] {
                //print(id,imageURL,instructions)
                recipes.append(RecipeModel(id: id  , name: name , contributor: contributor , imageURL: imageURL, tag: tag, instruction: instructions ))
                index += 1
                //print(recipes.count)
                //print(id)
            } else {
                errorMessage += "Problem parsing recipeDictionary\n"
            }
        }
    }
    
    
    
}

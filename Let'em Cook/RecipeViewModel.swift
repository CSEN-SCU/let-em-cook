//
//  RecipeViewModel.swift
//  Let'em Cook
//
//  Created by Arnav Choudhury on 11/9/23.
//

import SwiftUI

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

func getMeals(query: String) -> [Meal] {
    var results: [Meal] = []

    do {
        if let file = URL(string: "https://www.themealdb.com/api/json/v1/1/\(query)") {
            let data = try Data(contentsOf: file)
            let json = try JSONSerialization.jsonObject(with: data, options: [])

            if let object = json as? [String: Any] {

                if let meals = object["meals"] as? any Sequence {
                    for meal in meals {

                        if let mealDict = meal as? [String: Any] {
                            var result = Meal()

                            if mealDict.keys.contains("strMeal"){
                                if let val = mealDict["strMeal"] as? String {
                                    result.name = val
                                }
                            }

                            if mealDict.keys.contains("strCategory"){
                                if let val = mealDict["strCategory"] as? String {
                                    result.category = val
                                }
                            }

                            if mealDict.keys.contains("strArea"){
                                if let val = mealDict["strArea"] as? String {
                                    result.origin = val
                                }
                            }

                            if mealDict.keys.contains("strInstructions"){
                                if let val = mealDict["strInstructions"] as? String {
                                    result.instructions = val
                                }
                            }

                            if mealDict.keys.contains("strMealThumb"){
                                if let val = mealDict["strMealThumb"] as? String {
                                    result.thumbnail = val
                                }
                            }

                            for i in 1...20 {
                                if mealDict.keys.contains("strIngredient\(i)") && mealDict.keys.contains("strMeasure\(i)") {
                                    if let ingredientName = mealDict["strIngredient\(i)"] as? String,
                                       let measure = mealDict["strMeasure\(i)"] as? String {
                                        if !ingredientName.isEmpty && !measure.isEmpty  {
                                            result.ingredients.append(Ingredient(name: ingredientName, amount: measure))
                                        }
                                    }
                                }

                            }

                            results.append(result)
                        }
                    }
                }
            }

        } else {
            print("no file")
        }
    } catch {
        print(error.localizedDescription)
        return []
    }
    
    return results
}

@MainActor class RecipeViewModel: ObservableObject {
    @Published var meals: Meals?
    @Published var meal:Meal?
    init(){
        print("Recipe View Model Init")
    }
    func randomMeal() async{
        meals = Meals(meals: getMeals(query: "random.php"))
        
    }
    func mealsByFirstLetter(c: String) async{
        if (c.count > 1){
            return
        }
        
        meals = Meals(meals: getMeals(query: "search.php?f="+c))
    }
    func mealsBySearch(c: String) async{
        meals = Meals(meals: getMeals(query: "search.php?s="+c))
    }
    func mealsByIngredient(c:String) async{
        meals = Meals(meals: getMeals(query: "search.php?s="+"chicken"))
    }
}
